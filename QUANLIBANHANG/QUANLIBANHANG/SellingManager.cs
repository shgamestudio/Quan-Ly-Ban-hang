﻿using QUANLIBANHANG.DAL;
using QUANLIBANHANG.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Menu = QUANLIBANHANG.DTO.Menu;

namespace QUANLIBANHANG
{
    public partial class SellingManager : Form
    {
        public SellingManager()
        {
            InitializeComponent();
            LoadTable();
            
        }

        private void LoadTable()
        {
            List<Table> tables = TableDAL.Instance.LoadTableList();
            foreach (Table table in tables)
            {
                Button button = new Button { Width = TableDAL.TableButtonWidth, Height = TableDAL.TableButtonHeigh };
                button.Text = table.Name + Environment.NewLine + table.Status;
                button.Click += Button_Click;
                button.Tag = table.ID;//id ban
                switch(table.Status)
                {
                    case "TRỐNG":
                        button.BackColor = Color.Aqua;
                        break;
                    case "CÓ NGƯỜI":
                        button.BackColor = Color.LightPink;
                        break;
                }
                flowLayoutPanel1.Controls.Add(button);
            }
        }

        void ShowBill(int idTable)
        {
            listView1.Items.Clear();
            List<Menu> menus = MenuDAL.Instance.GetMenus(idTable);
            foreach (Menu menu in menus)
            {
                ListViewItem listViewItem = new ListViewItem(menu.FoodName);
                listViewItem.SubItems.Add(menu.Price.ToString());
                listViewItem.SubItems.Add(menu.SoLuong.ToString());
                listViewItem.SubItems.Add(menu.TotalPrice.ToString());
                listView1.Items.Add(listViewItem);
            }
        }
        private void Button_Click(object sender, EventArgs e)
        {
            int idTable = (int)(sender as Button).Tag;
            ShowBill(idTable);
        }

        private void thôngTinTàiKhoảnToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            AccountInfo accountInfo = new AccountInfo();
            accountInfo.ShowDialog();
        }

        private void đăngXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void adminToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Admin admin = new Admin();
            this.Hide();
            admin.ShowDialog();
            this.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

       
    }
}
