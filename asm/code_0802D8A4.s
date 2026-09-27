	.include "macro.inc"

	.syntax unified

	thumb_func_start WfxBlueHSync
WfxBlueHSync: @ 0x0802D8A4
	ldr r0, _0802D8D8 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xa0
	bls _0802D8B4
	movs r3, #0
_0802D8B4:
	ldr r0, _0802D8DC @ =0x0202BBB8
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _0802D8E0 @ =0x0000013F
	cmp r3, r0
	bls _0802D8E4
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	b _0802D8F2
	.align 2, 0
_0802D8D8: .4byte 0x04000006
_0802D8DC: .4byte 0x0202BBB8
_0802D8E0: .4byte 0x0000013F
_0802D8E4:
	movs r2, #0xa0
	lsls r2, r2, #0x13
	lsls r0, r3, #1
	ldr r1, _0802D8F4 @ =0x02002ADC
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_0802D8F2:
	bx lr
	.align 2, 0
_0802D8F4: .4byte 0x02002ADC
