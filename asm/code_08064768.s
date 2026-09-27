	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08064768
sub_08064768: @ 0x08064768
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08064790 @ =0x08BA4944
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	bl SetActiveCRSpellBgColorProc
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08064794 @ =0x081E98BC
	str r0, [r4, #0x48]
	ldr r0, _08064798 @ =0x0826A7E8
	str r0, [r4, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064790: .4byte 0x08BA4944
_08064794: .4byte 0x081E98BC
_08064798: .4byte 0x0826A7E8
