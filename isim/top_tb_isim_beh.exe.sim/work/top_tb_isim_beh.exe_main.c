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
    work_m_00000000002696129105_0189650569_init();
    work_m_00000000002021772083_2513369863_init();
    work_m_00000000002281850998_1919319509_init();
    work_m_00000000000865952165_0357013229_init();
    work_m_00000000001780031660_1984448065_init();
    xilinxcorelib_ver_m_00000000001358910285_3904265986_init();
    xilinxcorelib_ver_m_00000000001358910285_1465237985_init();
    xilinxcorelib_ver_m_00000000001687936702_0984770168_init();
    xilinxcorelib_ver_m_00000000000277421008_2786271766_init();
    xilinxcorelib_ver_m_00000000001603977570_4038103429_init();
    work_m_00000000003869038185_0158775612_init();
    work_m_00000000001443379869_1151974483_init();
    work_m_00000000001558348773_3666716740_init();
    work_m_00000000002759512145_1048382047_init();
    xilinxcorelib_ver_m_00000000001358910285_3743172433_init();
    xilinxcorelib_ver_m_00000000001687936702_2444198090_init();
    xilinxcorelib_ver_m_00000000000277421008_2626771148_init();
    xilinxcorelib_ver_m_00000000001603977570_2179411269_init();
    work_m_00000000002489990758_2581384236_init();
    work_m_00000000001009629239_4168706829_init();
    work_m_00000000004011363229_4146184915_init();
    work_m_00000000002857530164_2067334998_init();
    work_m_00000000003866293691_2760995339_init();
    work_m_00000000002480089346_3823007873_init();
    work_m_00000000002214916214_3115858369_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002214916214_3115858369");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}