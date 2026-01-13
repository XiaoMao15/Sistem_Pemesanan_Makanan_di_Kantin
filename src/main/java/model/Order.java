package model;

public class Order {
    private int id;
    private int userId;
    private int totalBayar;
    private String status;

    // Klik kanan -> Insert Code -> Getter & Setter
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public int getTotalBayar() { return totalBayar; }
    public void setTotalBayar(int totalBayar) { this.totalBayar = totalBayar; }
}