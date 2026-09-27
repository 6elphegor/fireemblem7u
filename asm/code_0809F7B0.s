	.include "macro.inc"

	.syntax unified

	thumb_func_start LoadAndVerfyLinkArenaStruct2
LoadAndVerfyLinkArenaStruct2: @ 0x0809F7B0
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F7FC
	cmp r4, #0
	bne _0809F7C6
	mov r4, sp
_0809F7C6:
	ldr r1, _0809F7F0 @ =0x03005E70
	ldr r0, _0809F7F4 @ =0x08CE3B58
	ldr r0, [r0]
	ldr r2, _0809F7F8 @ =0x00007120
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x14
	bl _call_via_r3
	adds r0, r4, #0
	movs r1, #0x10
	bl Checksum16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4, #0x10]
	cmp r4, r0
	bne _0809F7FC
	movs r0, #1
	b _0809F7FE
	.align 2, 0
_0809F7F0: .4byte 0x03005E70
_0809F7F4: .4byte 0x08CE3B58
_0809F7F8: .4byte 0x00007120
_0809F7FC:
	movs r0, #0
_0809F7FE:
	add sp, #0x14
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
