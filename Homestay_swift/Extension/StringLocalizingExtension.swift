/*
  StringLocalizingExtension.swift
  Homestay_swift

  Created by 陈毅琥 on 2020/8/12.
  Copyright © 2020 陈毅琥. All rights reserved.
*/

import Foundation

extension String {
    var localized: String { return NSLocalizedString(self, comment: self) }

    static var localized_check_in_registration_title : String { return  "check_in_registration_title".localized }
    static var localized_check_out_registration_title : String { return  "check_out_registration_title".localized }
    static var localized_today_check_in_amount_title : String { return  "today_check_in_amount_title".localized }
    static var localized_today_check_out_amount_title : String { return  "today_check_out_amount_title".localized }
    static var localized_spare_room_amount_title : String { return  "spare_room_amount_title".localized }
    static var localized_check_room_title : String { return  "check_room_title".localized }
    static var localized_check_customer_title : String { return  "check_customer_title".localized }
    static var localized_change_pasd_title : String { return  "change_pasd_title".localized }
    static var localized_about_us_title : String { return  "about_us_title".localized }
    static var localized_version_update_title : String { return  "version_update_title".localized }
    
    static var localized_room_manage_title : String { return  "room_manage_title".localized }
    static var localized_operation_record_title : String { return  "operation_record_title".localized }
    static var localized_room_modify_title : String { return  "room_modify_title".localized }
    static var localized_room_delete_title : String { return  "room_delete_title".localized }
    static var localized_operation_room_delete_title : String { return  "operation_room_delete_title".localized }
    static var localized_operation_room_modify_title : String { return  "operation_room_modify_title".localized }
    static var localized_operation_room_insert_title : String { return  "operation_room_insert_title".localized }
    static var localized_operation_check_out_title : String { return  "operation_check_out_title".localized }
    static var localized_operation_check_in_title : String { return  "operation_check_in_title".localized }
    
    static var localized_customer_record_title : String { return  "customer_record_title".localized }
    static var localized_all_title : String { return  "all_title".localized }
    static var localized_not_check_out_yet_title : String { return  "not_check_out_yet_title".localized }
    static var localized_time_search_title : String { return  "time_search_title".localized }
    static var localized_start_time_search_title : String { return  "start_time_search_title".localized }
    static var localized_end_time_search_title : String { return  "end_time_search_title".localized }
    
    static var localized_update_title : String { return  "update_title".localized }
    static var localized_no_need_update_tip : String { return  "no_need_update_tip".localized }
    static var localized_back_to_homepage_title : String { return  "back_to_homepage_title".localized }
    static var localized_about_us_content : String { return  "about_us_content".localized }
    static var localized_wrong_orign_pasd_tip : String { return  "wrong_orign_pasd_tip".localized }
    static var localized_wrong_confirm_pasd_tip : String { return  "wrong_confirm_pasd_tip".localized }
    static var localized_enter_origin_pasd_placeholder : String { return  "enter_origin_pasd_placeholder".localized }
    static var localized_enter_new_pasd_placeholder : String { return  "enter_new_pasd_placeholder".localized }
    static var localized_enter_confirm_pasd_placeholder : String { return  "enter_confirm_pasd_placeholder".localized }
    static var localized_confirm_title : String { return  "confirm_title".localized }
    
    static var localized_check_in_success_tip : String { return  "check_in_success_tip".localized }
    static var localized_check_out_success_tip : String { return  "check_out_success_tip".localized }
    static var localized_room_number_title : String { return  "room_number_title".localized }
    static var localized_name_title : String { return  "name_title".localized }
    static var localized_check_out_time_title : String { return  "check_out_time_title".localized }
    static var localized_check_in_time_title : String { return  "check_in_time_title".localized }
    static var localized_input_room_number_placeholder : String { return  "input_room_number_placeholder".localized }
    static var localized_room_number_not_exist_tip : String { return  "room_number_not_exist_tip".localized }
    static var localized_room_check_in_confirm_tip : String { return  "room_check_in_confirm_tip".localized }
    static var localized_id_card_title : String { return  "id_card_title".localized }
    static var localized_customer_detail_info_title : String { return  "customer_detail_info_title".localized }
    static var localized_confirm_check_in_title : String { return  "confirm_check_in_title".localized }
    
    static var localized_input_account_placeholder : String { return  "input_account_placeholder".localized }
    static var localized_input_pasd_placeholder : String { return  "input_pasd_placeholder".localized }
    static var localized_login_title : String { return  "login_title".localized }
    static var localized_homestay_info_title : String { return  "homestay_info_title".localized }
    static var localized_homestay_type_title : String { return  "homestay_type_title".localized }
    static var localized_homestay_name_title : String { return  "homestay_name_title".localized }
    static var localized_owner_name_title : String { return  "owner_name_title".localized }
    static var localized_contact_title : String { return  "contact_title".localized }
    static var localized_homestay_address_title : String { return  "homestay_address_title".localized }
    static var localized_confirm_activate_title : String { return  "confirm_activate_title".localized }
    static var localized_wrong_info_title : String { return  "wrong_info_title".localized }
    
    static var localized_tip_title : String { return  "tip_title".localized }
    static var localized_room_at_capacity_tip_title : String { return  "room_at_capacity_tip_title".localized }
    
}
