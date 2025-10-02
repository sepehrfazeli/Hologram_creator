Collecting workspace information# Hologram Creator

A 3D file display software for creating holographic images from 3D models.

## Overview

This application transforms 3D files (such as OBJ, 3DS, etc.) into holographic images that can be displayed using pyramid-shaped glass or plexiglass. The software was developed as part of a thesis project titled "Preparation and Implementation of 3D File Display Software on Hologram."

## Features

- **3D File Support**: Load various 3D file formats including OBJ, 3DS, STL, and more
- **Hologram Generation**: Creates 4-view hologram images suitable for pyramid display devices
- **Real-time Preview**: Multiple camera views with switching capabilities
- **Image Processing**: Built-in image filtering and processing capabilities
- **Export Options**: Save hologram images and textures

## Technology Stack

- **Language**: Delphi/Pascal
- **Graphics Engine**: OpenGL via GLScene
- **Platform**: Windows Operating System
- **Image Processing**: Custom image processing components

## Project Structure

### Main Components

- fMain.pas / fMain.dfm - Main application form with 3D viewer and controls
- front.pas / front.dfm - Frontend interface with camera controls
- unit2.pas / unit2.dfm - Hologram image generation and display
- dGLSViewer.pas / dGLSViewer.dfm - Data module for file dialogs
- fGLForm.pas / fGLForm.dfm - Base form class with language support

### Key Features Implementation

#### Multi-Camera System
The application uses 4 cameras positioned at different angles to capture views for hologram generation:
- `Camera1`, `Camera2`, `camera3`, `camera4` - Four camera objects for different viewpoints

#### 3D File Loading
Supports multiple 3D file formats through GLScene:
- OBJ, 3DS, STL, LWO, MD2, MD3, PLY, and more
- Texture support with material libraries

#### Hologram Processing
- Real-time rendering from 4 different camera angles
- Image composition for pyramid display
- Automatic scaling and positioning

## How to Use

1. **Load a 3D Model**: Use the File menu to open supported 3D files
2. **Adjust View**: Use camera controls to position the model
3. **Generate Hologram**: Press Space to capture 4-view images and generate hologram
4. **Display**: Use the generated image with a pyramid-shaped glass or plexiglass device

## Hardware Requirements

- Windows Operating System
- OpenGL-compatible graphics card
- Pyramid-shaped glass or plexiglass for hologram display

## Building the Project

The project is built using Delphi and requires the GLScene library for OpenGL functionality. Key dependencies include:
- GLScene components
- Image processing units (TypecastU, ImFilterU, ImagePrU)

## Thesis Context

This software was developed to address the need for accessible holographic display technology in design and architecture. Traditional physical modeling methods are time-consuming and less accurate, while this digital approach provides:

- Cost-effective holographic visualization
- Easy iteration and modification
- Professional presentation capabilities
- Virtual reality derivatives for design showcase

The application enables designers, architects, and other professionals to create engaging holographic presentations of their 3D models for exhibitions, stores, and client presentations.

## File Structure

```
├── Hologram.dpr          # Main program file
├── fMain.pas/.dfm        # Main application form
├── front.pas/.dfm        # Frontend interface
├── unit2.pas/.dfm        # Hologram processing
├── dGLSViewer.pas/.dfm   # File dialogs data module
├── fGLForm.pas/.dfm      # Base form class
├── Unit1.pas/.fmx        # Additional utility form
├── assets/               # Image assets
│   ├── process_diagram.jpg
│   └── pyramid_glass.png
└── README.md            # This file
