import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class UTS_NO_3 {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Hitung Gaji ");
        frame.setSize(350, 300);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setLayout(new GridLayout(6, 2, 10, 10));

        JLabel namaLabel = new JLabel("Nama:");
        JTextField namaField = new JTextField();

        JLabel gajiLabel = new JLabel("Gaji:");
        JTextField gajiField = new JTextField();

        JLabel bonusLabel = new JLabel("Bonus:");
        JTextField bonusField = new JTextField();

        JLabel dendaLabel = new JLabel("Denda:");
        JTextField dendaField = new JTextField();

        JButton totalButton = new JButton("Total");
        JLabel totalLabel = new JLabel("Total Gaji:");

        JTextField totalField = new JTextField();
        totalField.setEditable(false);

        frame.add(namaLabel);
        frame.add(namaField);

        frame.add(gajiLabel);
        frame.add(gajiField);

        frame.add(bonusLabel);
        frame.add(bonusField);

        frame.add(dendaLabel);
        frame.add(dendaField);

        frame.add(totalButton);
        frame.add(totalLabel);

        frame.add(new JLabel()); 
        frame.add(totalField);


        totalButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                try {
                    double gaji = Double.parseDouble(gajiField.getText());
                    double bonus = Double.parseDouble(bonusField.getText());
                    double denda = Double.parseDouble(dendaField.getText());

                    double total = gaji + bonus - denda;
                    totalField.setText(String.valueOf(total));
                } catch (NumberFormatException ex) {
                    JOptionPane.showMessageDialog(frame, "Masukkan angka yang valid!", "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        });
        frame.setVisible(true);
    }
}
