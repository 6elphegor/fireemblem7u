	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801080C
sub_0801080C: @ 0x0801080C
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _08010830
	ldr r0, _0801082C @ =0x08B91EDC
	bl Proc_Find
	bl Proc_End
	movs r0, #0
	b _08010858
	.align 2, 0
_0801082C: .4byte 0x08B91EDC
_08010830:
	adds r0, r1, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08010850
	ldr r0, _0801084C @ =0x08B91EDC
	bl Proc_Find
	bl Proc_End
	b _08010856
	.align 2, 0
_0801084C: .4byte 0x08B91EDC
_08010850:
	ldr r0, _0801085C @ =0x08B91F14
	bl Proc_StartBlocking
_08010856:
	movs r0, #2
_08010858:
	pop {r1}
	bx r1
	.align 2, 0
_0801085C: .4byte 0x08B91F14
