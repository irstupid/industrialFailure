package frc.robot;

import com.revrobotics.spark.SparkMax;
import com.revrobotics.spark.SparkLowLevel.MotorType;

public class Drive 
{
    SparkMax lf;


    Drive()
    {
        lf = new SparkMax(20, MotorType.kBrushless);
    }

    void periodic()
    {
        lf.set(1);
    }
}
