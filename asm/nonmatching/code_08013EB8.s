	.include "macro.inc"

	.syntax unified

	thumb_func_start FadeExists
FadeExists: @ 0x08013EB8
	push {lr}
	ldr r0, _08013EE8 @ =0x08B9294C
	bl Proc_Find
	cmp r0, #0
	bne _08013EF8
	ldr r0, _08013EEC @ =0x08B9292C
	bl Proc_Find
	cmp r0, #0
	bne _08013EF8
	ldr r0, _08013EF0 @ =0x08B9298C
	bl Proc_Find
	cmp r0, #0
	bne _08013EF8
	ldr r0, _08013EF4 @ =0x08B9296C
	bl Proc_Find
	cmp r0, #0
	bne _08013EF8
	movs r0, #0
	b _08013EFA
	.align 2, 0
_08013EE8: .4byte 0x08B9294C
_08013EEC: .4byte 0x08B9292C
_08013EF0: .4byte 0x08B9298C
_08013EF4: .4byte 0x08B9296C
_08013EF8:
	movs r0, #1
_08013EFA:
	pop {r1}
	bx r1
	.align 2, 0
