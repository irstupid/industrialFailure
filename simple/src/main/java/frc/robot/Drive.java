package frc.robot;

import com.revrobotics.spark.SparkMax;
import com.revrobotics.spark.SparkLowLevel.MotorType;

public class Drive 
{
    private SparkMax lf;
    private SparkMax lb;
    private SparkMax rf;
    private SparkMax rb;

    private double x;
    private double y;
    private double turn;


    Drive()
    {
        lf = new SparkMax(20, MotorType.kBrushless);
        rf = new SparkMax(21, MotorType.kBrushless);
        lb = new SparkMax(22, MotorType.kBrushless);
        rb = new SparkMax(23, MotorType.kBrushless);
    }

    void periodic()
    {
        double lfPower = -x + y - turn;
        double rfPower = -x - y + turn;
        double lbPower = -x - y - turn;
        double rbPower = -x + y + turn;

        lf.set(-lfPower * 0.5);
        rf.set(-rfPower * 0.5);
        lb.set(lbPower * 0.5);
        rb.set(-rbPower * 0.5);
    }

    void setInput(double x, double y, double turn)
    {
        this.x = x;
        this.y = y;
        this.turn = turn;
    }
}
