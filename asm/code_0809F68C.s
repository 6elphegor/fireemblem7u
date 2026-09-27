	.include "macro.inc"

	.syntax unified

	thumb_func_start LoadAndVerifySoundRoomData
LoadAndVerifySoundRoomData: @ 0x0809F68C
	push {r4, lr}
	sub sp, #0x24
	adds r4, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F6D8
	cmp r4, #0
	bne _0809F6A2
	mov r4, sp
_0809F6A2:
	ldr r1, _0809F6CC @ =0x03005E70
	ldr r0, _0809F6D0 @ =0x08CE3B58
	ldr r0, [r0]
	ldr r2, _0809F6D4 @ =0x000070FC
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x24
	bl _call_via_r3
	adds r0, r4, #0
	movs r1, #0x20
	bl Checksum16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4, #0x20]
	cmp r4, r0
	bne _0809F6D8
	movs r0, #1
	b _0809F6DA
	.align 2, 0
_0809F6CC: .4byte 0x03005E70
_0809F6D0: .4byte 0x08CE3B58
_0809F6D4: .4byte 0x000070FC
_0809F6D8:
	movs r0, #0
_0809F6DA:
	add sp, #0x24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
