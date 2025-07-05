<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Club Merchandise System</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">

    <style>
        * {
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            background-color: #f4f7fa;
            color: #333;
        }
        header {
            background-color: #2f3e9e;
            color: white;
            padding: 20px 40px;
            text-align: center;
            font-size: 24px;
        }
        nav {
            display: flex;
            justify-content: space-between;
            background-color: #fff;
            padding: 10px 40px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        nav a {
            text-decoration: none;
            color: #2f3e9e;
            margin: 0 15px;
            font-weight: bold;
        }
        .container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 40px;
        }
        .card {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            transition: 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card h3 {
            color: #2f3e9e;
        }
        .stat {
            font-size: 28px;
            margin-top: 10px;
        }
       
   
        footer {
            text-align: center;
            padding: 15px;
            background-color: #2f3e9e;
            color: white;
            margin-top: 30px;
        }
          .menu-bar {
            display: flex;
            justify-content: center;
            background-color: #2f3e9e;
            padding: 20px;
            gap: 50px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
          }

          .menu-item {
            position: relative;
            color: black;
            font-weight: bold;
            font-size: 18px;
            text-transform: uppercase;
            text-decoration: none;
            padding: 10px 20px;
            transition: color 0.3s ease;
          }

          .menu-item::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 20%;
            width: 60%;
            height: 3px;
            background-color: white;
            transform: scaleX(0);
            transform-origin: center;
            transition: transform 0.3s ease;
          }

          .menu-item:hover::after {
            transform: scaleX(1);
          }

          .menu-item:hover {
            color: #FFD700;
          }

    </style>
</head>
<body>

<header>
    Campus Event & Club Merchandise Management System
</header>

<nav>
    <div>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="merchandise.jsp">Merchandise</a>
        <a href="users.jsp">Users</a>
        <a href="orders.jsp">Orders</a>
    </div>
    <div>
        <span>Welcome</span>
        <a href="logout.jsp">Logout</a>
    </div>
</nav>

<section class="container">
    <div class="card">
        <h3>Total Merchandise</h3>
        <div class="stat">120</div>
    </div>
    <div class="card">
        <h3>Registered Users</h3>
        <div class="stat">78</div>
    </div>
    <div class="card">
        <h3>Orders Placed</h3>
        <div class="stat">56</div>
    </div>
    <div class="card">
        <h3>Pending Approvals</h3>
        <div class="stat">8</div>
    </div>
</section>
    
    <section class="dashboard-actions">
  <h2 style="text-align: center; color: #2f3e9e;">Quick Actions</h2>

  <div class="action-buttons">
    <a href="clubEvents.jsp" class="action-btn">Browse Club Events</a>
    <a href="catalog.jsp" class="action-btn">View Merchandise Catalog</a>
    <a href="placeOrder.jsp" class="action-btn">Place Merchandise Order</a>
  </div>
</section>


<div class="register-section">
  <a href="registration.jsp" class="register-btn">Register Now !</a>
</div>

<!-- Centered Menu Section -->
<div class="menu-container">
  <nav class="menu-vertical">
      <a href="event.jsp" class="menu-item"><i class="fas fa-calendar-alt"></i> Event</a>
    <div class="gallery">
      <div class="gallery-item">
        <img src="img/event1.jpg" alt="event 1">
        <p>Pertandingan Kawad Kaki (PERKAD)</p>
      </div>
      <div class="gallery-item">
        <img src="img/event2.jpg" alt="event 2">
        <p>Sukan Antara Fakulti (SAF)</p>
      </div>
      <div class="gallery-item">
        <img src="img/event3.jpg" alt="event 3">
        <p>Sukan Program (SuPro)</p>
      </div>
      <div class="gallery-item">
        <img src="img/event4.jpg" alt="event 4">
        <p>Sukan Kolej (SUKOL)</p>
      </div>
    </div>
      
    <a href="club.jsp" class="menu-item"><i class="fas fa-users"></i> Club</a>
    <div class="gallery">
        <div class="gallery-item">
          <img src="img/club1.jpg" alt="Club 1">
          <p>Kelab Bola Sepak</p>
        </div>
        <div class="gallery-item">
          <img src="img/club2.jpg" alt="Club 2">
          <p>Kelab Berenang</p>
        </div>
        <div class="gallery-item">
          <img src="img/club3.jpg" alt="Club 3">
          <p>Kelab Rekreasi</p>
        </div>
        <div class="gallery-item">
          <img src="img/club4.jpg" alt="Club 4">
          <p>Kelab Badminton</p>
        </div>
    </div>

    <a href="eventinfo.jsp" class="menu-item"><i class="fas fa-info-circle"></i> Merchandise</a>
    <div class="gallery">
      <div class="gallery-item">
        <img src="img/merc1.jpg" alt="merc 1">
        <p>Keychain Kelab</p>
      </div>
      <div class="gallery-item">
        <img src="img/merc2.jpg" alt="merc 2">
        <p>Jersi Kelab</p>
      </div>
      <div class="gallery-item">
        <img src="img/merc3.jpg" alt="merc 3">
        <p>Topi Kelab</p>
      </div>
      <div class="gallery-item">
        <img src="img/merc4.jpg" alt="merc 4">
        <p>Drawstring Bag Kelab</p>
      </div>
    </div>

  </nav>
</div>

<footer>
    &copy; 2025 Campus Event & Club Merchandise System
</footer>

<!-- External JS Libraries -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- Animation Script -->
<script>
  document.querySelectorAll('.menu-item').forEach(item => {
    item.addEventListener('click', () => {
      alert(`Navigating to: ${item.textContent}`);
    });
  });
</script>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

<script src="menu_script.js"></script>

</body>
</html>
