	.include "macro.inc"

	.syntax unified

	thumb_func_start LoadAndVerfyRankData
LoadAndVerfyRankData: @ 0x0809F0D8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F12C
	cmp r5, #0
	bne _0809F0EC
	ldr r5, _0809F11C @ =0x02020140
_0809F0EC:
	ldr r1, _0809F120 @ =0x03005E70
	ldr r0, _0809F124 @ =0x08CE3B58
	ldr r0, [r0]
	ldr r2, _0809F128 @ =0x00007044
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r5, #0
	movs r2, #0x94
	bl _call_via_r3
	adds r4, r5, #0
	adds r4, #0x90
	adds r0, r5, #0
	movs r1, #0x90
	bl Checksum16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4]
	cmp r4, r0
	bne _0809F12C
	movs r0, #1
	b _0809F12E
	.align 2, 0
_0809F11C: .4byte 0x02020140
_0809F120: .4byte 0x03005E70
_0809F124: .4byte 0x08CE3B58
_0809F128: .4byte 0x00007044
_0809F12C:
	movs r0, #0
_0809F12E:
	pop {r4, r5}
	pop {r1}
	bx r1
