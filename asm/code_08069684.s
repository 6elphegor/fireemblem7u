	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08069684
sub_08069684: @ 0x08069684
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806969A
	adds r0, r5, #0
	bl Proc_Break
	b _080696CA
_0806969A:
	ldr r4, _080696D4 @ =0x0202012C
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl Interpolate
	strh r0, [r4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _080696CA
	adds r0, r5, #0
	bl Proc_Break
_080696CA:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080696D4: .4byte 0x0202012C
