	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801E66C
sub_0801E66C: @ 0x0801E66C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r2, #0x1c
	rsbs r2, r2, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #5
	movs r1, #0x24
	bl Interpolate
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _0801E6CC @ =0x0202BBB8
	adds r2, r0, #0
	adds r2, #0x38
	ldrb r1, [r2]
	subs r1, #1
	strb r1, [r2]
	adds r0, #0x39
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0801E6C2
	movs r0, #0xf
	strh r0, [r4]
	adds r0, r5, #0
	bl Proc_Break
_0801E6C2:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801E6CC: .4byte 0x0202BBB8
