	.include "macro.inc"

	.syntax unified

	thumb_func_start LoadBonusContentData
LoadBonusContentData: @ 0x0809F134
	push {r4, r5, lr}
	adds r5, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F188
	cmp r5, #0
	bne _0809F148
	ldr r5, _0809F178 @ =0x02020140
_0809F148:
	ldr r1, _0809F17C @ =0x03005E70
	ldr r0, _0809F180 @ =0x08CE3B58
	ldr r0, [r0]
	ldr r2, _0809F184 @ =0x00007134
	adds r0, r0, r2
	movs r2, #0xa1
	lsls r2, r2, #2
	ldr r3, [r1]
	adds r1, r5, #0
	bl _call_via_r3
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r4, r5, r1
	adds r0, r5, #0
	bl Checksum16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4]
	cmp r4, r0
	bne _0809F188
	movs r0, #1
	b _0809F18A
	.align 2, 0
_0809F178: .4byte 0x02020140
_0809F17C: .4byte 0x03005E70
_0809F180: .4byte 0x08CE3B58
_0809F184: .4byte 0x00007134
_0809F188:
	movs r0, #0
_0809F18A:
	pop {r4, r5}
	pop {r1}
	bx r1
