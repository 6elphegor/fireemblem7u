	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08073438
sub_08073438: @ 0x08073438
	push {r4, r5, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xb
	ble _0807347A
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	bl Proc_Break
_0807347A:
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r4, r3, #0
	adds r4, #0x48
	ldr r3, [r7]
	ldr r4, [r7]
	adds r2, r4, #0
	adds r4, #0x48
	ldrh r5, [r4]
	adds r2, r5, #1
	adds r4, r3, #0
	adds r3, #0x48
	ldrh r4, [r3]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r2, #0
	orrs r5, r4
	adds r4, r5, #0
	strh r4, [r3]
	lsls r3, r2, #0x10
	asrs r2, r3, #0x10
	ldr r3, _080734C0 @ =0x08C9DCDC
	str r3, [sp]
	movs r3, #0xc
	bl sub_08076D8C
	add sp, #8
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080734C0: .4byte 0x08C9DCDC
