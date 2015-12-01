/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    unisims_ver_m_00000000003317509437_1759035934_init();
    unisims_ver_m_00000000003927721830_1593237687_init();
    work_m_00000000002938575888_0057398904_init();
    work_m_00000000003859528007_3909150987_init();
    work_m_00000000004119401358_0788499569_init();
    work_m_00000000000424219493_0302257608_init();
    work_m_00000000000424219493_3199294148_init();
    unisims_ver_m_00000000003266096158_0690727491_init();
    work_m_00000000003038222770_3027548060_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003038222770_3027548060");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
