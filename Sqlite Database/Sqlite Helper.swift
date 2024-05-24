//
//  Sqlite Helper.swift
//  Sqlite Database
//
//  Created by R92 on 09/02/24.
//

import Foundation
import UIKit
import SQLite3

class SqliteHelper {
    
    static var file : OpaquePointer?
    
    static func creatFile(){
        var a = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        a.appendPathComponent("My Student Data.db")
        sqlite3_open(a.path, &file)
        print("Creat A File")
        print(a.path)
        creatTable()
    }
    
    static func creatTable(){
        let q = "Create Table if not exists Students (grid integer, name text, surname text)"
        var table: OpaquePointer?
        sqlite3_prepare(file, q, -1, &table, nil)
        sqlite3_step(table)
        print("Create Table")
        
    }
    
    static func addData(grid: Int , name: String , surName: String){
        
        let q = "insert into students values (\(grid),'\(name)','\(surName)')"
        var add: OpaquePointer?
        sqlite3_prepare(file, q, -1, &add, nil)
        sqlite3_step(add)
        print("add data")
    }
    
    static func getData(){
        let q = "SELECT * FROM Students"
        var read: OpaquePointer?
        sqlite3_prepare(file, q, -1, &read, nil)
        while sqlite3_step(read) == SQLITE_ROW {
            let grid = sqlite3_column_int(read, 0)
            print(grid)
            if let name = sqlite3_column_text(read, 1) {
                print(String(cString: name))
            }
            if let sarname = sqlite3_column_text(read, 2) {
                print(String(cString: sarname))
            }
            print("\n")
        }
    }
    
    static func updateData(grid: Int,name: String,surname: String){
        let q = "UPDATE Students SET name = '\(name)', surname = '\(surname)' WHERE grid = \(grid);"
        var update: OpaquePointer?
        sqlite3_prepare(file, q, -1, &update, nil)
        sqlite3_step(update)
        print("Update data")
    }
    
    static func deleteData(grid : Int){
        let q = "DELETE FROM Students WHERE grid = \(grid)"
        var delete: OpaquePointer?
        sqlite3_prepare(file, q, -1, &delete, nil)
        sqlite3_step(delete)
        print("Delete data")
        
    }
}
