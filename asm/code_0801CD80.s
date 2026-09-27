	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801CD80
sub_0801CD80: @ 0x0801CD80
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801CDB0 @ =0x0203A85C
	ldrb r0, [r0, #0x11]
	cmp r0, #0x1b
	beq _0801CDA2
	ldr r0, _0801CDB4 @ =0x08B95AAC
	ldr r2, _0801CDB8 @ =0x0202BBB8
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartSemiCenteredOrphanMenu
_0801CDA2:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801CDB0: .4byte 0x0203A85C
_0801CDB4: .4byte 0x08B95AAC
_0801CDB8: .4byte 0x0202BBB8
