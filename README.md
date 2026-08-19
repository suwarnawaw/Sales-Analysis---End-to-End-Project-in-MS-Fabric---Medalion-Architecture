# Sales-Analysis---End-to-End-Project-in-MS-Fabric---Medalion-Architecture
Sales Analysis - End to End Project in MS Fabric - Medalion Architecture using three different workspace and deployment pipeline

🚀 **From Raw Data to Production: My End-to-End Microsoft Fabric Analytics Project**

I recently completed an end-to-end **Microsoft Fabric Sales Analytics project** — and the goal was not just to build a dashboard.

The real objective was to build a **production-ready analytics solution** with proper data architecture, version control, and deployment practices. 💡

### 🏗️ What I built

🔹 **Medallion Architecture**
→ Bronze Layer
→ Silver Layer
→ Gold Layer

🔹 **Microsoft Fabric Lakehouses**
→ Bronze Lakehouse -
     → Raw data ingestion into Fabric Lakehouse
     → Data retained close to source for traceability
     → Dataflows Gen2 used for ingestion
     → Source-aligned structures
     → Preservation of source data for traceability

→ Silver Lakehouse - 
     → Data cleansing and standardization
     → Data quality transformation
     → Standardization and business-rule application
     → Removal of duplicates and inconsistencies
     → Preparation of analytics-ready entities

→ Gold Lakehouse
     → Business-ready curated data
     → Fact and dimension modeling
     → KPI-ready datasets
     → Optimized structures for reporting and analytics
     → Designed with dimensional modeling principles

🔹 **Data Pipeline**
→ Orchestration of the end-to-end data flow
→ Automated movement and transformation

🔹 **Data Transformation**
→ Dataflows Gen2 for ingestion and transformation

🔹 **Semantic Modeling**
A dedicated Power BI Semantic Model sits above the curated Gold layer. The model was designed with a strong focus on:
→ Clear business grain
→ Fact and dimension relationships
→ Consistent KPI definitions
→ Reusable measures
→ Analytical performance
→ Enterprise-style semantic model
→ Business-friendly measures and KPIs
→ Optimized analytical structure

🔹 **Power BI Dashboard**
The final report provides visibility into:

📊 Total Sales
📦 Total Orders
💰 Sales per Order
🛍️ Number of Products
👥 Total Customers
📈 Sales trends by date
📊 Sales and orders by category

🔄 And the part I’m particularly excited about…

The objective was not to create “more visuals”  & this project was not limited to development. 

It was to create a trusted analytical layer that answers business questions quickly and consistently.

🔄 **Git Integration & Deployment**

One of the most important aspects of the project was treating analytics development as an engineering lifecycle, rather than a manual report-building exercise.

The Fabric workspace was integrated with Git, enabling:

🔹 Version control
🔹 Branch-based development
🔹 Change tracking
🔹 Collaboration
🔹 Controlled synchronization

The solution was connected with **GitHub**, allowing Fabric artifacts to be version-controlled, while the deployment pipeline enabled controlled promotion of the solution across environments.

This brings a more disciplined CI/CD mindset to the analytics platform and reduces the risks associated with manually moving reports, semantic models, pipelines, and data artifacts between environments.

Development → Test → Production

So the overall flow became:

**Source → Bronze → Silver → Gold → Semantic Model → Power BI → Git → Deployment Pipeline → Production**


I implemented **Git integration and a deployment pipeline**, bringing DevOps practices into the analytics workflow.


That changes the conversation from:

❌ *“I built a Power BI dashboard.”*

to:

✅ **“I designed and implemented an end-to-end, production-oriented Microsoft Fabric analytics solution.”**

🎯 **The Data Modeller's Perspective**

💡 The biggest lesson from this project

As a data modeller, I strongly believe:

A successful BI solution doesn't start with a dashboard. It starts with understanding the business grain, defining the right model, establishing trustworthy data pipelines, and creating a governed semantic layer.

The dashboard is simply the last mile. Good analytics starts with good data modeling — not good visualization.

The real engineering happens underneath it.

A beautiful dashboard built on inconsistent data will always create trust issues.

A well-designed model, however, creates the foundation for:

Reliable KPIs → Consistent analytics → Better performance → Faster decision-making

The analytical model was structured around:
• Fact-based transactional analysis
• Conformed dimensions
• Business-friendly relationships
• Consistent KPI definitions
• Separation of transformation logic from reporting logic
• A semantic layer designed for reusable analytics

From dashboard development → to engineering the entire analytics ecosystem. 🚀

Snapshot of Executive Summary -

<img width="1348" height="735" alt="image" src="https://github.com/user-attachments/assets/46ad98d3-a9d6-48cb-a20e-d3c0f8026a3b" />


🎯 **Key technologies**

**Microsoft Fabric | OneLake | Lakehouse | Dataflows Gen2 | Data Pipelines | Semantic Models | Power BI | GitHub | Deployment Pipelines | Medallion Architecture | SQL**

What I enjoyed most about this project was seeing how **data engineering, data modeling, BI, Git, and CI/CD come together inside a single modern analytics platform.**

💡 **Modern BI is no longer just about creating reports.
It’s about building reliable, scalable, governed and deployable data products.**

And this project was a great hands-on example of exactly that. 🚀

#MicrosoftFabric #PowerBI #DataEngineering #DataAnalytics #AnalyticsEngineering #MicrosoftPowerBI #Fabric #Lakehouse #MedallionArchitecture #DataModeling #GitHub #DevOps #CICD #DataPipeline #DataflowGen2 #OneLake #BusinessIntelligence #DataEngineer #BI #Azure #DataModeling #DataEngineering #SemanticModel #Git #CICD #DeploymentPipeline #DataAnalytics #PowerBIDeveloper #DataModeller

📬 Connect With Me - If you are interested in Power BI, Data Analytics, or Business Intelligence solutions, 
feel free to connect. suwarna.w@gmail.com https://www.linkedin.com/in/suwarnamala-wawhal
#BusinessIntelligence #Fabric #Azure #PowerBIDeveloper #DataEngineer

