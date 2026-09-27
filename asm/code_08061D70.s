	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08061D70
sub_08061D70: @ 0x08061D70
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6, #0x44]
	cmp r0, r1
	ble _08061DD6
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r5, _08061DE0 @ =0x08BA3F5C
	movs r0, #0x2e
	ldrsh r4, [r6, r0]
	lsls r0, r4, #4
	adds r0, r0, r5
	ldr r1, [r0]
	lsls r4, r4, #2
	adds r0, r4, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	adds r0, r4, #2
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r3, [r0]
	adds r4, #3
	lsls r4, r4, #2
	adds r4, r4, r5
	ldr r4, [r4]
	ldr r0, [r6, #0x60]
	str r4, [sp]
	bl sub_08061DE8
	ldrh r0, [r6, #0x2e]
	adds r0, #1
	strh r0, [r6, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6, #0x48]
	cmp r0, r1
	ble _08061DD6
	ldr r1, _08061DE4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08061DD6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08061DE0: .4byte 0x08BA3F5C
_08061DE4: .4byte 0x0201774C
