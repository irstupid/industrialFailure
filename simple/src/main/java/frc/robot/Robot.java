// Copyright (c) FIRST and other WPILib contributors.
// Open Source Software; you can modify and/or share it under the terms of
// the WPILib BSD license file in the root directory of this project.

package frc.robot;

import edu.wpi.first.wpilibj.TimedRobot;
import edu.wpi.first.wpilibj.XboxController;
import edu.wpi.first.wpilibj.smartdashboard.SendableChooser;
import edu.wpi.first.wpilibj.smartdashboard.SmartDashboard;

public class Robot extends TimedRobot 
{
  private static final String AUTO1 = "auto1";
  private String auto;
  private final SendableChooser<String> autoChooser = new SendableChooser<>();

  XboxController controller;

  Drive drive;

  //init
  public Robot() 
  {
    autoChooser.setDefaultOption("Default Auto", "default");
    autoChooser.addOption("do somthing ", AUTO1);
    SmartDashboard.putData("Auto choices", autoChooser);
  }

  // runs every 20ms, no matter what
  @Override
  public void robotPeriodic() {}

  @Override
  public void autonomousInit() 
  {
    auto = autoChooser.getSelected();
    // m_autoSelected = SmartDashboard.getString("Auto Selector", kDefaultAuto);
    System.out.println("Auto selected: " + auto);
  }

  /** This function is called periodically during autonomous. */
  @Override
  public void autonomousPeriodic() 
  {
    switch (auto) {
      case AUTO1:
        // Put custom auto code here
        break;
      default:
        // Put default auto code here
        break;
    }
  }

  @Override
  public void teleopInit() 
  {
    controller = new XboxController(0);
    drive = new Drive();
  }

  @Override
  public void teleopPeriodic() 
  {
    drive.setInput(-controller.getLeftY(), controller.getLeftX(), controller.getRightX());
    drive.periodic();
  }

  @Override
  public void disabledInit() {}

  @Override
  public void disabledPeriodic() {}

  @Override
  public void testInit() {}

  @Override
  public void testPeriodic() {}
  
  @Override
  public void simulationInit() {}

  @Override
  public void simulationPeriodic() {}
}
