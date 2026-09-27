	.include "macro.inc"

	.syntax unified

	thumb_func_start ReadGlobalSaveInfo
ReadGlobalSaveInfo: @ 0x0809E4F0
	push {r4, r5, lr}
	sub sp, #0x64
	adds r5, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809E564
	cmp r5, #0
	bne _0809E506
	mov r5, sp
_0809E506:
	ldr r1, _0809E550 @ =0x03005E70
	ldr r0, _0809E554 @ =0x08CE3B58
	ldr r0, [r0]
	ldr r3, [r1]
	adds r1, r5, #0
	movs r2, #0x64
	bl _call_via_r3
	ldr r1, _0809E558 @ =0x0840F430
	adds r0, r5, #0
	bl StringEquals
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809E564
	ldr r1, [r5, #8]
	ldr r0, _0809E55C @ =0x00030317
	cmp r1, r0
	bne _0809E564
	ldr r0, _0809E560 @ =0x0000200A
	ldrh r1, [r5, #0xc]
	cmp r1, r0
	bne _0809E564
	adds r4, r5, #0
	adds r4, #0x60
	adds r0, r5, #0
	movs r1, #0x50
	bl Checksum16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4]
	cmp r4, r0
	bne _0809E564
	movs r0, #1
	b _0809E566
	.align 2, 0
_0809E550: .4byte 0x03005E70
_0809E554: .4byte 0x08CE3B58
_0809E558: .4byte 0x0840F430
_0809E55C: .4byte 0x00030317
_0809E560: .4byte 0x0000200A
_0809E564:
	movs r0, #0
_0809E566:
	add sp, #0x64
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
