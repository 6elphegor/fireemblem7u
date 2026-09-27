	.include "macro.inc"

	.syntax unified

	thumb_func_start FE6Link_OnEnd
FE6Link_OnEnd: @ 0x080435D4
	push {lr}
	ldr r0, _080435F8 @ =0x08B98B60
	bl Proc_EndEach
	ldr r0, _080435FC @ =0x08B98B88
	bl Proc_EndEach
	ldr r0, _08043600 @ =0x08B98B38
	bl Proc_EndEach
	bl SioReleaseIrq
	bl CloseHelpBox
	bl sub_0803C414
	pop {r0}
	bx r0
	.align 2, 0
_080435F8: .4byte 0x08B98B60
_080435FC: .4byte 0x08B98B88
_08043600: .4byte 0x08B98B38
