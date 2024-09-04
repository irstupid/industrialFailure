package org.firstinspires.ftc.teamcode;

import com.qualcomm.robotcore.eventloop.opmode.LinearOpMode;
import com.qualcomm.robotcore.eventloop.opmode.TeleOp;
import com.qualcomm.robotcore.hardware.DcMotor;
import com.qualcomm.robotcore.hardware.DcMotorSimple;
import com.qualcomm.robotcore.hardware.Servo;

@TeleOp(name="vroomVroomGoShootShoot")
public class drive extends LinearOpMode {

    DcMotor LF;
    DcMotor RF;
    DcMotor LB;
    DcMotor RB;

    DcMotor shoot1;
    DcMotor shoot2;
    DcMotor intake;
    Servo convayer;
    Servo turn;
    Servo aim;

    public void runOpMode()
    {
         LF = hardwareMap.get(DcMotor.class, "leftFront");
         RF = hardwareMap.get(DcMotor.class, "rightFront");
         LB = hardwareMap.get(DcMotor.class, "leftBack");
         RB = hardwareMap.get(DcMotor.class, "rightBack");

//         shoot1 = hardwareMap.get(DcMotor.class, "shoot1");
//         shoot2 = hardwareMap.get(DcMotor.class, "shoot2");
//         shoot2.setDirection(DcMotorSimple.Direction.REVERSE);
//         intake = hardwareMap.get(DcMotor.class, "intake");
//         convayer = hardwareMap.get(Servo.class, "convayer");
//         turn = hardwareMap.get(Servo.class, "turn");
//         aim = hardwareMap.get(Servo.class, "aim");



        waitForStart();
        while (opModeIsActive())
        {
            drive(gamepad1.left_stick_x, gamepad1.left_stick_y, gamepad1.right_stick_x);
            //intake(gamepad1.left_trigger, gamepad1.left_trigger > 0.1);
            //aim(gamepad1.dpad_up, gamepad1.dpad_down, gamepad1.dpad_left, gamepad1.dpad_right);
            //shoot(gamepad1.left_bumper, gamepad1.right_bumper);
        }
    }

    public void intake(float in, boolean out)
    {
        if(!out){intake.setPower(in);}
        else {intake.setPower(-1);}

    }

    public void aim(boolean upUp, boolean upDown, boolean turnLeft, boolean turnRight)
    {
        if(upUp){aim.setPosition(1);}
        else if(upDown){aim.setPosition(0);}
        else{aim.setPosition(0.5);}

        if(turnLeft){turn.setPosition(1);}
        else if(turnRight){turn.setPosition(0);}
        else{turn.setPosition(0.5);}
    }

    public void shoot(boolean spin, boolean fire)
    {
        if(spin)
        {
            shoot1.setPower(1);
            shoot2.setPower(1);
        }
        else
        {
            shoot1.setPower(0);
            shoot2.setPower(0);
        }

        if(fire)
        {
            convayer.setPosition(1);
        }
        else
        {
            convayer.setPosition(0.5);
        }
    }

    public void drive(float x, float y, float turn)
    {
        double LFP = turn + x + y;
        double RFP = turn - x - y;
        double LBP = turn - x + y;
        double RBP = turn + x - y;

        LF.setPower(LFP);
        LB.setPower(LBP);
        RF.setPower(RFP);
        RB.setPower(RBP);
    }
}
