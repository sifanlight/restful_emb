#include "opencv2/objdetect.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/imgproc.hpp"
#include "opencv2/videoio.hpp"
#include <opencv2/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include<opencv2/opencv.hpp>
#include <iostream>
#include <cstdlib>
#include <string>
#include <thread>
#include <atomic>
#include <chrono>
#include <cstring>
#include <stdio.h>
#include <ctime>
#include "mqtt/async_client.h"
#include "mysql_connection.h"

#include <cppconn/driver.h>
#include <cppconn/exception.h>
#include <cppconn/resultset.h>
#include <cppconn/statement.h>
using namespace cv;
using namespace std;
const string address	{ "0.0.0.0:1883" };
const string CLIENT_ID				{ "paho_cpp_async_publish" };
const string PERSIST_DIR			{ "./persist" };
const string TOPIC { "/sensors/" };
const int  QOS = 1;
const auto TIMEOUT = std::chrono::seconds(10);


const char* LWT_PAYLOAD = "Last will and testament.";

class callback : public virtual mqtt::callback
{
public:
	void connection_lost(const string& cause) override {
		cout << "\nConnection lost" << endl;
		if (!cause.empty())
			cout << "\tcause: " << cause << endl;
	}

	void delivery_complete(mqtt::delivery_token_ptr tok) override {
		cout << "\tDelivery complete for token: "
			<< (tok ? tok->get_message_id() : -1) << endl;
	}
};

/////////////////////////////////////////////////////////////////////////////

/**
 * A base action listener.
 */
class action_listener : public virtual mqtt::iaction_listener
{
protected:
	void on_failure(const mqtt::token& tok) override {
		cout << "\tListener failure for token: "
			<< tok.get_message_id() << endl;
	}

	void on_success(const mqtt::token& tok) override {
		cout << "\tListener success for token: "
			<< tok.get_message_id() << endl;
	}
};

/////////////////////////////////////////////////////////////////////////////

/**
 * A derived action listener for publish events.
 */
class delivery_action_listener : public action_listener
{
	atomic<bool> done_;

	void on_failure(const mqtt::token& tok) override {
		action_listener::on_failure(tok);
		done_ = true;
	}

	void on_success(const mqtt::token& tok) override {
		action_listener::on_success(tok);
		done_ = true;
	}

public:
	delivery_action_listener() : done_(false) {}
	bool is_done() const { return done_; }
};





int detectAndDisplay( Mat frame );
CascadeClassifier face_cascade;
int main( )
{
	FILE *fp;
	char buff[100];
	char sqlstates[200];
	int cpu1, cpu2, cpu3, idle, load, tempCPU;
	load = 0;
	tempCPU = 0;


	sql::Driver *driver;
  sql::Connection *con;
  sql::Statement *stmt;
//  sql::ResultSet *res;

  /* Create a connection */
  driver = get_driver_instance();
  con = driver->connect("tcp://127.0.0.1:3306", "sina", "pass");
  /* Connect to the MySQL test database */
  con->setSchema("project");
  stmt = con->createStatement();
  stmt->execute("create table if not exists `sina`(`time` INT, `load` INT, `temp` INT, `faces` INT)"); 



    mqtt::async_client client(address, CLIENT_ID, PERSIST_DIR);
    callback cb;
	client.set_callback(cb);

    auto connOpts = mqtt::connect_options_builder()
		.clean_session()
		.will(mqtt::message(TOPIC, LWT_PAYLOAD, QOS))
        .user_name("sina")
        .password("sina")
		.finalize();
    cout<<"sending message"<<endl;
    mqtt::token_ptr conntok = client.connect(connOpts);
    conntok->wait();
    int number = 24;
   // mqtt::message_ptr pubmsg = mqtt::make_message("/sensors/", to_string(number) );
	//	pubmsg->set_qos(QOS);
	//	client.publish(pubmsg)->wait_for(TIMEOUT);




    cv::VideoCapture camera(0);
    if (!camera.isOpened()) {
        std::cerr << "ERROR: Could not open camera" << std::endl;
        return 1;
    }

    if( !face_cascade.load( "/home/sinlap/opencv/opencv/data/haarcascades/haarcascade_frontalcatface.xml" ) )
    {
        cout << "--(!)Error loading face cascade\n";
        return -1;
    };

//    Mat frame = imread("face11.jpg", IMREAD_COLOR);
	int faceNumber = 0;
	int temp = 0;
	time_t now;
	tm *ltm = localtime(&now);
	int currentTime;
    namedWindow("Face");
    mqtt::message_ptr pubmsg = mqtt::make_message("/sensors/faces/", to_string(faceNumber) );
		    pubmsg->set_qos(QOS);
		    client.publish(pubmsg)->wait_for(TIMEOUT);
	mqtt::message_ptr pubcpuLoad = mqtt::make_message("/sensors/load/", to_string(load) );
		    pubcpuLoad->set_qos(QOS);
		    client.publish(pubcpuLoad)->wait_for(TIMEOUT);
	mqtt::message_ptr pubcputemp = mqtt::make_message("/sensors/temp/", to_string(tempCPU) );
		    pubcputemp->set_qos(QOS);
		    client.publish(pubcputemp)->wait_for(TIMEOUT);
	while (1) {
	    Mat frame;
	    camera >> frame;
	    temp = detectAndDisplay( frame );
        if (temp != faceNumber){
            faceNumber = temp;
           

			fp = fopen("/proc/stat","r");
			// CPU Word
			fscanf(fp, "%s ", buff);
			// First Number
			fscanf(fp, "%s ", buff);
			sscanf(buff, "%d", &cpu1);
			//Second Number
			fscanf(fp, "%s ", buff);
			sscanf(buff, "%d", &cpu2);
			//Third Number
			fscanf(fp, "%s ", buff);
			sscanf(buff, "%d", &cpu3);
			// Idle time
			fscanf(fp, "%s ", buff);
			sscanf(buff, "%d", &idle);
			fclose(fp);

			load = ((cpu1+cpu2+cpu3)/(idle/100));
			fp = fopen("/sys/class/thermal/thermal_zone0/temp", "r");
			fscanf(fp, "%s ", buff);
			sscanf(buff, "%d", &tempCPU);

			pubmsg = mqtt::make_message("/sensors/faces/", to_string(faceNumber) );
		    pubmsg->set_qos(QOS);
		    client.publish(pubmsg)->wait_for(TIMEOUT);

			pubcpuLoad = mqtt::make_message("/sensors/load/", to_string(load) );
		    pubcpuLoad->set_qos(QOS);
		    client.publish(pubcpuLoad)->wait_for(TIMEOUT);

			 pubcputemp = mqtt::make_message("/sensors/temp/", to_string(tempCPU) );
		    pubcputemp->set_qos(QOS);
		    client.publish(pubcputemp)->wait_for(TIMEOUT);

			now = time(0);
			currentTime = (ltm->tm_hour*10000) + (ltm->tm_min*100) + ltm->tm_sec;
			sprintf(sqlstates, "insert into sina values(%d, %d, %d, %d)", currentTime, load, tempCPU, faceNumber);
			  stmt->execute(sqlstates); 

        }
	    if (cv::waitKey(10) >= 0)
            break;
}
	delete stmt;
  delete con;

	
    return 0;
}


int detectAndDisplay( Mat frame )
{
	char timeCurrent[10];
	time_t now = time(0);
	char* dt = ctime(&now);
	tm *ltm = localtime(&now);
	sprintf(timeCurrent, "%d:%d:%d", ( ltm->tm_hour), ltm->tm_min,ltm->tm_sec);
    Mat frame_gray;
    cvtColor( frame, frame_gray, COLOR_BGR2GRAY );
    equalizeHist( frame_gray, frame_gray );
    //-- Detect faces
    std::vector<Rect> faces;
    face_cascade.detectMultiScale( frame_gray, faces );	
    for ( size_t i = 0; i < faces.size(); i++ )
    {

	 cv::putText(frame, 
            to_string(i+1),
            cv::Point(faces[i].x+(faces[i].width/2),faces[i].y - 10), 
            cv::FONT_HERSHEY_COMPLEX_SMALL, 
            1.0, 
            cv::Scalar(255,255,255), 
            1, 
            cv:: LINE_AA);
	 

	rectangle( frame, Point(faces[i].x, faces[i].y), Point(faces[i].x + faces[i].width, faces[i].y + faces[i].height), Scalar(0, 0, 255), 3, LINE_8);
        Mat faceROI = frame_gray( faces[i] );
	}
	cv::putText(frame, 
            (timeCurrent),
            cv::Point(0, 50), 
            cv::FONT_HERSHEY_COMPLEX_SMALL, 
            1.0, 
            cv::Scalar(255,255,255), 
            1, 
            cv:: LINE_AA);


    imshow( "Capture - Face detection", frame );
    return (faces.size());
}


