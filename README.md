# 🏎️ CFD Simulation Automation Pipeline  

![AGH Racing FSG Team](/assets/logo.jpg)

---

## ⚠️ Warning: Demo Version

This GitHub repository is a demo of the actual project. Some files have been replaced with placeholders to protect confidential information and because they were not authored by the repo owner.

The rest of the README includes documentation for the missing files. Refer to it for details on functionality and structure.

---

## 📖 Overview
A robust automation system for CFD simulations using **STAR-CCM+** on **PLGrid Ares cluster** that handles:

1. Automated job submission
2. Parallel execution 
3. Comprehensive post-processing
4. Results visualization
5. Documentation


---

## 🧩 Components

### 🔧 Core Scripts
| Script | Purpose | 
|--------|---------|
| `main_script.sh` | Orchestrates simulation workflow |
| `get_scripts.sh` | User-specific setup |

### ⚙️ Simulation
| Script | Resources |
|--------|-----------|
| `simrun.sh` | Queues for CPU node |
| `batch.sh` | Executes STAR-CCM+ Meshing & Simulation|


### 🎨 Post-Processing 
| Script | Function |
|--------|----------|
| `pprun.sh` | Queues for GPU node |
| `batchGPU.sh` | Executes STAR-CCM+ Post Processing Steps |


### 📊 STAR-CCM+ Macros
| Macro | Outputs |
|-------|---------|
| `post.java` | CSV exports + visualizations(Work in Progress) |
| `PP.java` | Old Macro(to be depracated) |

### 📚 Documentation
| Macro | Result |
|------|-------|
| `dataload.cls` | Loads data from `.csv` files into result mastersheet |
| `documentation.mlx` | Creates `.pdf` summary of results |
*documentation.mlx courtesy of another AGH Racing member*
---

## 📂 Project Structure
```bash
.
├── assets/                 # README assets
├── README.md
├── .gitattributes
├── documentation/          # Documentation workflow(Stored in cloud/locally)
│  ├── documentation.mlx        # Summary creation
│  └── mastersheet/
│     ├── Mastersheet.xlsm
│     └── dataload.cls          # Loads data into excel(executed inside .xlsm)
└── simulation/             # Simulation automation(Stored on cluster)
   ├── get_scripts.sh           # Installation
   └── simulations/
      ├── main_script.sh        # Workflow control
      └── scripts/              # All operational scripts
         ├── batch.sh
         ├── batchGPU.sh
         ├── simrun.sh
         ├── pprun.sh
         ├── post.java
         └── PP.java
```

---

## 🔄 Workflow Steps

1. **Setup**  
```bash
./get_scripts.sh [your_folder_name]
```

2. **Preparation**  
   - Add `.sim` files to `~/simulations`
   - Run:  
```bash 
./main_script.sh
```

3. **Automated Steps**  
   - Creates dedicated folders for `*.sim` files
   - Submits jobs:
     - `simrun.sh` (CPU simulation)
     - `pprun.sh` (GPU post-processing)

4. **To-Be-Automated**
   - Export post-processing results
   - Run `load_data` macro to log key values
   - Run `documentation.mlx` to document entire simulation

5. **Output**  
   - 📈 `.csv` data files  
   - 🖼️ Visualization `.png` and `.mp4` files
   - 📚 Documentation in form of `.pdf` and an `.xlsx` record

---


## 🚧 Roadmap

- [ ] Fix post-processing execution stability
- [ ] Implement MATLAB/VBA data pipeline for automatic documentation

---

## 📜 License
Proprietary - AGH Racing Internal Use

---

## 🙏 Acknowledgments 
*Batch scripts and run files were provied by ACK Cyfronet AGH and modified to fit the project's purpose. STAR-CCM+ macros were generated automatically.*




