	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepUnit_InitSMS
PrepUnit_InitSMS: @ 0x080932BC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl ApplyUnitSpritePalettes
	movs r0, #0
	str r0, [sp]
	ldr r1, _080932EC @ =0x02022BC0
	ldr r2, _080932F0 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl MakePrepUnitList
	ldr r0, [r4, #0x14]
	bl PrepAutoCapDeployUnits
	bl PrepUpdateSMS
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080932EC: .4byte 0x02022BC0
_080932F0: .4byte 0x01000008
