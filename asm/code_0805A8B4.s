	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805A8B4
sub_0805A8B4: @ 0x0805A8B4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805A8DC
	ldr r1, _0805A8D8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b _0805A920
	.align 2, 0
_0805A8D8: .4byte 0x0201774C
_0805A8DC:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bne _0805A920
	movs r0, #0
	strh r0, [r4, #0x2e]
	movs r0, #2
	str r0, [r4, #0x44]
	bl sub_08004CC4
	cmp r0, #4
	ble _0805A90A
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x48]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r4, #0x48]
	bl sub_0805A928
_0805A90A:
	bl sub_08004CC4
	cmp r0, #4
	ble _0805A920
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x48]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r4, #0x48]
	bl sub_0805A928
_0805A920:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
