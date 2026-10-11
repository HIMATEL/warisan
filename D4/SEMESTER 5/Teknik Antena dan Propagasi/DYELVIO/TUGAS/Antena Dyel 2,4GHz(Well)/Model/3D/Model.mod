'# MWS Version: Version 2019.0 - Sep 20 2018 - ACIS 28.0.2 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 2.2 fmax = 2.5
'# created = '[VERSION]2019.0|28.0.2|20180920[/VERSION]


'@ use template: Antenna - Planar_Dyelvio.cfg

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
'set the units
With Units
    .Geometry "mm"
    .Frequency "GHz"
    .Voltage "V"
    .Resistance "Ohm"
    .Inductance "H"
    .TemperatureUnit  "Kelvin"
    .Time "ns"
    .Current "A"
    .Conductance "Siemens"
    .Capacitance "F"
End With
'----------------------------------------------------------------------------
'set the frequency range
Solver.FrequencyRange "2", "3"
'----------------------------------------------------------------------------
Plot.DrawBox True
With Background
     .Type "Normal"
     .Epsilon "1.0"
     .Mu "1.0"
     .XminSpace "0.0"
     .XmaxSpace "0.0"
     .YminSpace "0.0"
     .YmaxSpace "0.0"
     .ZminSpace "0.0"
     .ZmaxSpace "0.0"
End With
With Boundary
     .Xmin "expanded open"
     .Xmax "expanded open"
     .Ymin "expanded open"
     .Ymax "expanded open"
     .Zmin "expanded open"
     .Zmax "expanded open"
     .Xsymmetry "none"
     .Ysymmetry "none"
     .Zsymmetry "none"
End With
' optimize mesh settings for planar structures
With Mesh
     .MergeThinPECLayerFixpoints "True"
     .RatioLimit "20"
     .AutomeshRefineAtPecLines "True", "6"
     .FPBAAvoidNonRegUnite "True"
     .ConsiderSpaceForLowerMeshLimit "False"
     .MinimumStepNumber "5"
     .AnisotropicCurvatureRefinement "True"
     .AnisotropicCurvatureRefinementFSM "True"
End With
With MeshSettings
     .SetMeshType "Hex"
     .Set "RatioLimitGeometry", "20"
     .Set "EdgeRefinementOn", "1"
     .Set "EdgeRefinementRatio", "6"
End With
With MeshSettings
     .SetMeshType "HexTLM"
     .Set "RatioLimitGeometry", "20"
End With
With MeshSettings
     .SetMeshType "Tet"
     .Set "VolMeshGradation", "1.5"
     .Set "SrfMeshGradation", "1.5"
End With
' change mesh adaption scheme to energy
' 		(planar structures tend to store high energy
'     	 locally at edges rather than globally in volume)
MeshAdaption3D.SetAdaptionStrategy "Energy"
' switch on FD-TET setting for accurate farfields
FDSolver.ExtrudeOpenBC "True"
PostProcess1D.ActivateOperation "vswr", "true"
PostProcess1D.ActivateOperation "yz-matrices", "true"
With FarfieldPlot
	.ClearCuts ' lateral=phi, polar=theta
	.AddCut "lateral", "0", "1"
	.AddCut "lateral", "90", "1"
	.AddCut "polar", "90", "1"
End With
'----------------------------------------------------------------------------
Dim sDefineAt As String
sDefineAt = "2;2.5;3"
Dim sDefineAtName As String
sDefineAtName = "2;2.5;3"
Dim sDefineAtToken As String
sDefineAtToken = "f="
Dim aFreq() As String
aFreq = Split(sDefineAt, ";")
Dim aNames() As String
aNames = Split(sDefineAtName, ";")
Dim nIndex As Integer
For nIndex = LBound(aFreq) To UBound(aFreq)
Dim zz_val As String
zz_val = aFreq (nIndex)
Dim zz_name As String
zz_name = sDefineAtToken & aNames (nIndex)
' Define E-Field Monitors
With Monitor
    .Reset
    .Name "e-field ("& zz_name &")"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .MonitorValue  zz_val
    .Create
End With
' Define H-Field Monitors
With Monitor
    .Reset
    .Name "h-field ("& zz_name &")"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .MonitorValue  zz_val
    .Create
End With
' Define Farfield Monitors
With Monitor
    .Reset
    .Name "farfield ("& zz_name &")"
    .Domain "Frequency"
    .FieldType "Farfield"
    .MonitorValue  zz_val
    .ExportFarfieldSource "False"
    .Create
End With
Next
'----------------------------------------------------------------------------
With MeshSettings
     .SetMeshType "Hex"
     .Set "Version", 1%
End With
With Mesh
     .MeshType "PBA"
End With
'set the solver type
ChangeSolverType("HF Time Domain")
'----------------------------------------------------------------------------

'@ define material: Copper (annealed)

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Material
     .Reset
     .Name "Copper (annealed)"
     .Folder ""
.FrqType "static"
.Type "Normal"
.SetMaterialUnit "Hz", "mm"
.Epsilon "1"
.Mu "1.0"
.Kappa "5.8e+007"
.TanD "0.0"
.TanDFreq "0.0"
.TanDGiven "False"
.TanDModel "ConstTanD"
.KappaM "0"
.TanDM "0.0"
.TanDMFreq "0.0"
.TanDMGiven "False"
.TanDMModel "ConstTanD"
.DispModelEps "None"
.DispModelMu "None"
.DispersiveFittingSchemeEps "Nth Order"
.DispersiveFittingSchemeMu "Nth Order"
.UseGeneralDispersionEps "False"
.UseGeneralDispersionMu "False"
.FrqType "all"
.Type "Lossy metal"
.SetMaterialUnit "GHz", "mm"
.Mu "1.0"
.Kappa "5.8e+007"
.Rho "8930.0"
.ThermalType "Normal"
.ThermalConductivity "401.0"
.HeatCapacity "0.39"
.MetabolicRate "0"
.BloodFlow "0"
.VoxelConvection "0"
.MechanicsType "Isotropic"
.YoungsModulus "120"
.PoissonsRatio "0.33"
.ThermalExpansionRate "17"
.Colour "1", "1", "0"
.Wireframe "False"
.Reflection "False"
.Allowoutline "True"
.Transparentoutline "False"
.Transparency "0"
.Create
End With

'@ new component: component1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Component.New "component1"

'@ define brick: component1:Ground

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Ground" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-Wg/2", "Wg/2" 
     .Yrange "0", "Lg" 
     .Zrange "0", "t" 
     .Create
End With

'@ define material: Rogers RT5880 (lossy)

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Material
     .Reset
     .Name "Rogers RT5880 (lossy)"
     .Folder ""
.FrqType "all"
.Type "Normal"
.SetMaterialUnit "GHz", "mm"
.Epsilon "2.2"
.Mu "1.0"
.Kappa "0.0"
.TanD "0.0009"
.TanDFreq "10.0"
.TanDGiven "True"
.TanDModel "ConstTanD"
.KappaM "0.0"
.TanDM "0.0"
.TanDMFreq "0.0"
.TanDMGiven "False"
.TanDMModel "ConstKappa"
.DispModelEps "None"
.DispModelMu "None"
.DispersiveFittingSchemeEps "General 1st"
.DispersiveFittingSchemeMu "General 1st"
.UseGeneralDispersionEps "False"
.UseGeneralDispersionMu "False"
.Rho "0.0"
.ThermalType "Normal"
.ThermalConductivity "0.20"
.SetActiveMaterial "all"
.Colour "0.94", "0.82", "0.76"
.Wireframe "False"
.Transparency "0"
.Create
End With

'@ define brick: component1:Substract

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Substract" 
     .Component "component1" 
     .Material "Rogers RT5880 (lossy)" 
     .Xrange "-Wg/2", "Wg/2" 
     .Yrange "0", "Lg" 
     .Zrange "t", "t+h" 
     .Create
End With

'@ define brick: component1:Patch

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Patch" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-W/2", "W/2" 
     .Yrange "Lf", "Lf+L" 
     .Zrange "t+h", "t+h+t" 
     .Create
End With

'@ define brick: component1:Feed

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Feed" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-Wf/2", "Wf/2" 
     .Yrange "0", "L/2" 
     .Zrange "t+h", "t+h+t" 
     .Create
End With

'@ define brick: component1:Inset

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Inset" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-Wf/Gpf", "Wf/Gpf" 
     .Yrange "0", "L/2" 
     .Zrange "t+h", "t+h+t" 
     .Create
End With

'@ boolean subtract shapes: component1:Patch, component1:Inset

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Patch", "component1:Inset"

'@ boolean add shapes: component1:Patch, component1:Feed

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Add "component1:Patch", "component1:Feed"

'@ pick face

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickFaceFromId "component1:Patch", "3"

'@ define port: 1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "False" 
     .ClipPickedPortToBound "False" 
     .Xrange "-2.5", "2.5" 
     .Yrange "0", "0" 
     .Zrange "1.635", "1.67" 
     .XrangeAdd "2", "2" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "2", "2" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ define monitor: e-field (f=2.4)

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=2.4)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "2.4" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-29.5", "29.5", "0", "51.37", "-0.365", "3.67" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define monitor: h-field (f=2.4)

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=2.4)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "2.4" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-29.5", "29.5", "0", "51.37", "-0.365", "3.67" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define farfield monitor: farfield (f=2.4)

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Monitor 
     .Reset 
     .Name "farfield (f=2.4)" 
     .Domain "Frequency" 
     .FieldType "Farfield" 
     .MonitorValue "2.4" 
     .ExportFarfieldSource "False" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-29.5", "29.5", "0", "51.37", "-0.365", "3.67" 
     .SetSubvolumeOffset "10", "10", "10", "10", "10", "10" 
     .SetSubvolumeInflateWithOffset "False" 
     .SetSubvolumeOffsetType "FractionOfWavelength" 
     .Create 
End With

'@ define time domain solver parameters

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-40"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ set PBA version

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Discretizer.PBAVersion "2018092019"

'@ farfield plot options

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With FarfieldPlot 
     .Plottype "3D" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "5" 
     .Step2 "5" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "-1" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .ShowStructureProfile "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .SetMaxReferenceMode "abs" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "isotropic_linear" 
     .Phistart "1.000000e+00", "0.000000e+00", "0.000000e+00" 
     .Thetastart "0.000000e+00", "0.000000e+00", "1.000000e+00" 
     .PolarizationVector "0.000000e+00", "1.000000e+00", "0.000000e+00" 
     .SetCoordinateSystemType "ludwig2ae" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Slant" 
     .SlantAngle 0.000000e+00 
     .Origin "bbox" 
     .Userorigin "0.000000e+00", "0.000000e+00", "0.000000e+00" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+00" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+01" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 
     .AddCut "lateral", "0", "1"  
     .AddCut "lateral", "90", "1"  
     .AddCut "polar", "90", "1"  
     .StoreSettings
End With

'@ define frequency range

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solver.FrequencyRange "2.2", "2.5"

'@ farfield plot options

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With FarfieldPlot 
     .Plottype "3D" 
     .Vary "angle1" 
     .Theta "0" 
     .Phi "0" 
     .Step "5" 
     .Step2 "5" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "-1" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "True" 
     .ShowStructureProfile "True" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "True" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Gain" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .SetMaxReferenceMode "abs" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "isotropic" 
     .Phistart "1.000000e+00", "0.000000e+00", "0.000000e+00" 
     .Thetastart "0.000000e+00", "0.000000e+00", "1.000000e+00" 
     .PolarizationVector "0.000000e+00", "1.000000e+00", "0.000000e+00" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Abs" 
     .SlantAngle 0.000000e+00 
     .Origin "bbox" 
     .Userorigin "0.000000e+00", "0.000000e+00", "0.000000e+00" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+00" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+01" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 
     .AddCut "lateral", "0", "1"  
     .AddCut "lateral", "90", "1"  
     .AddCut "polar", "90", "1"  
     .StoreSettings
End With

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "26", "18"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "0"
    .SetOrientation "Smart Mode"
    .SetDistance "3.424574"
    .SetViewVector "0.000000", "-0.000046", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With
Pick.ClearAllPicks

'@ delete dimension 0

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .RemoveDimension "0"
End With

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "26", "18"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "1"
    .SetOrientation "Smart Mode"
    .SetDistance "3.259759"
    .SetViewVector "0.000000", "-0.000004", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With
Pick.ClearAllPicks

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "25", "17"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "2"
    .SetOrientation "Smart Mode"
    .SetDistance "2.274018"
    .SetViewVector "-0.000000", "-0.000043", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With
Pick.ClearAllPicks

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "45", "26"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "3"
    .SetOrientation "Smart Mode"
    .SetDistance "2.127387"
    .SetViewVector "-0.000000", "-0.000043", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With
Pick.ClearAllPicks

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "3", "33"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "4"
    .SetOrientation "Smart Mode"
    .SetDistance "5.872285"
    .SetViewVector "-0.000000", "-0.000043", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With
Pick.ClearAllPicks

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "42", "29"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "5"
    .SetOrientation "Smart Mode"
    .SetDistance "-11.021625"
    .SetViewVector "-0.000000", "-0.000043", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With
Pick.ClearAllPicks

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Substract", "3", "3"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "6"
    .SetOrientation "Smart Mode"
    .SetDistance "6.120032"
    .SetViewVector "-0.000000", "-0.000043", "-1.000000"
    .SetConnectedElement1 "component1:Substract"
    .SetConnectedElement2 "component1:Substract"
    .Create
End With
Pick.ClearAllPicks

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Substract", "2", "2"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "7"
    .SetOrientation "Smart Mode"
    .SetDistance "5.493931"
    .SetViewVector "-0.000000", "-0.000043", "-1.000000"
    .SetConnectedElement1 "component1:Substract"
    .SetConnectedElement2 "component1:Substract"
    .Create
End With
Pick.ClearAllPicks

'@ delete dimension 4

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .RemoveDimension "4"
End With

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "1", "1"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "8"
    .SetOrientation "Smart Mode"
    .SetDistance "5.608099"
    .SetViewVector "0.000000", "-0.000019", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With
Pick.ClearAllPicks

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "4", "4"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "9"
    .SetOrientation "Smart Mode"
    .SetDistance "2.830884"
    .SetViewVector "0.000000", "-0.000029", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With
Pick.ClearAllPicks

'@ delete dimension 8

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .RemoveDimension "8"
End With

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "1", "1"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "10"
    .SetOrientation "Smart Mode"
    .SetDistance "3.019709"
    .SetViewVector "0.000000", "-0.000012", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With
Pick.ClearAllPicks

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "43", "32"

'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "11"
    .SetOrientation "Smart Mode"
    .SetDistance "-0.557344"
    .SetViewVector "0.000000", "-0.000005", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With
Pick.ClearAllPicks

'@ farfield plot options

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With FarfieldPlot 
     .Plottype "Polar" 
     .Vary "angle1" 
     .Theta "0" 
     .Phi "0" 
     .Step "1" 
     .Step2 "1" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "-1" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "True" 
     .ShowStructureProfile "True" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "True" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .SetMaxReferenceMode "abs" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "isotropic" 
     .Phistart "1.000000e+00", "0.000000e+00", "0.000000e+00" 
     .Thetastart "0.000000e+00", "0.000000e+00", "1.000000e+00" 
     .PolarizationVector "0.000000e+00", "1.000000e+00", "0.000000e+00" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Abs" 
     .SlantAngle 0.000000e+00 
     .Origin "bbox" 
     .Userorigin "0.000000e+00", "0.000000e+00", "0.000000e+00" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+00" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+01" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 
     .AddCut "lateral", "0", "1"  
     .AddCut "lateral", "90", "1"  
     .AddCut "polar", "90", "1"  
     .StoreSettings
End With 

'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "26", "18" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "12"
    .SetOrientation "Smart Mode"
    .SetDistance "5.760278"
    .SetViewVector "0.000000", "-0.000028", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With

Pick.ClearAllPicks


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Substract", "2", "2" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "13"
    .SetOrientation "Smart Mode"
    .SetDistance "7.646013"
    .SetViewVector "0.000000", "-0.000028", "-1.000000"
    .SetConnectedElement1 "component1:Substract"
    .SetConnectedElement2 "component1:Substract"
    .Create
End With

Pick.ClearAllPicks


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "27", "19" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "14"
    .SetOrientation "Smart Mode"
    .SetDistance "7.119511"
    .SetViewVector "0.000000", "-0.000028", "-1.000000"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With

Pick.ClearAllPicks


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Substract", "3", "3" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "15"
    .SetOrientation "Smart Mode"
    .SetDistance "7.938613"
    .SetViewVector "0.000000", "-0.000028", "-1.000000"
    .SetConnectedElement1 "component1:Substract"
    .SetConnectedElement2 "component1:Substract"
    .Create
End With

Pick.ClearAllPicks


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "42", "29" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "16"
    .SetOrientation "Smart Mode"
    .SetDistance "-4.823720"
    .SetViewVector "-0.003491", "0.003463", "-0.999988"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With

Pick.ClearAllPicks


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "28", "20" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "17"
    .SetOrientation "Smart Mode"
    .SetDistance "-20.146812"
    .SetViewVector "-0.003491", "0.003463", "-0.999988"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With

Pick.ClearAllPicks


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "4", "4" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "18"
    .SetOrientation "Smart Mode"
    .SetDistance "2.657690"
    .SetViewVector "-0.003491", "0.003463", "-0.999988"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With

Pick.ClearAllPicks


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Substract", "4", "4" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "19"
    .SetOrientation "Smart Mode"
    .SetDistance "15.132695"
    .SetViewVector "-0.003491", "0.003448", "-0.999988"
    .SetConnectedElement1 "component1:Substract"
    .SetConnectedElement2 "component1:Substract"
    .Create
End With

Pick.ClearAllPicks


'@ delete dimension 19

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .RemoveDimension "19"
End With


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "49", "36" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "20"
    .SetOrientation "Smart Mode"
    .SetDistance "-2.468212"
    .SetViewVector "-0.003491", "0.003472", "-0.999988"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With

Pick.ClearAllPicks


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "1", "1" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "21"
    .SetOrientation "Smart Mode"
    .SetDistance "10.085556"
    .SetViewVector "-0.003491", "0.003448", "-0.999988"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With

Pick.ClearAllPicks


'@ delete dimension 17

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .RemoveDimension "17"
End With


'@ pick edge

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickEdgeFromId "component1:Patch", "28", "20" 


'@ define distance dimension

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Dimension
    .Reset
    .CreationType "picks"
    .SetType "Distance"
    .SetID "22"
    .SetOrientation "Smart Mode"
    .SetDistance "-36.292778"
    .SetViewVector "-0.024099", "-0.055935", "-0.998144"
    .SetConnectedElement1 "component1:Patch"
    .SetConnectedElement2 "component1:Patch"
    .Create
End With

Pick.ClearAllPicks


