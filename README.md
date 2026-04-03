# Cohort Analysis & Retention Rate Project

## Project Overview
This project focuses on analyzing **user retention** to evaluate the effectiveness of different marketing channels and assess the overall customer lifecycle. The goal was to identify which acquisition sources provide the highest long-term value.

## Tools & Technologies
* **SQL (PostgreSQL):** Data extraction, cleaning, and cohort grouping.
* **Google Sheets:** Data visualization, retention matrices, and final reporting.

## Data Structure
The analysis was based on two primary tables providing user profiles and activity logs.

### **Table 1: Users**
| Column | Description |
| :--- | :--- |
| **user_id** | Unique identifier for the user (Primary Key) |
| **full_name** | User's first and last name |
| **email** | User's email address (includes noise: extra spaces, mixed case) |
| **country** | User's country of origin |
| **signup_datetime** | Registration date and time (stored in various text formats) |
| **signup_source** | Marketing channel or source of acquisition |
| **signup_device** | Device type used for registration |
| **promo_signup_flag** | 1 — Promotion-based user, 0 — Organic user |

### **Table 2: Events**
| Column | Description |
| :--- | :--- |
| **event_id** | Unique identifier for the event |
| **user_id** | Associated user ID (Foreign Key to Users table) |
| **event_datetime** | Date and time of the event in various formats |
| **event_type** | Type of activity: `login`, `view_content`, `purchase`, `registration`, etc. |
| **revenue** | Transaction amount (if applicable) |

## My Tasks
* **Data Processing:** Structured raw user data into monthly cohorts.
* **Retention Analysis:** Calculated the percentage of active users over a 5-month period.
* **Behavioral Insights:** Compared organic and promotional user behavior.
* **Strategic Recommendations:** Developed actionable steps to improve LTV.

## Key Results
* **Significant Gap:** Identified that **organic users** show a **56% retention rate** by Month 5.
* **Comparison:** Organic retention is **6x higher** than that of promo users (**9%**).
* **Business Impact:** Recommended a strategic shift in marketing focus toward organic growth channels to maximize long-term profitability.

---

### [View Project / Spreadsheet](https://docs.google.com/spreadsheets/d/1DL8FSZUi8e_z3d-l9luV4mqaj81TTZpujFBrBq4YHRI/edit?usp=sharing)
