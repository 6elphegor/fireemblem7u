	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitKakudai1
UnitKakudai1: @ 0x0805175C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _0805186C @ =0x081D8594
	ldr r0, _08051870 @ =0x0203E02C
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldr r1, _08051874 @ =0x081D856C
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r6, [r0]
	bl UpdateBanimFrame
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08051794
	ldr r1, _08051878 @ =0x0203A3D8
	movs r0, #0x40
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08051794
	ldr r0, _0805187C @ =0x02022860
	movs r1, #0x17
	movs r2, #1
	bl EfxPalModifyPetrifyEffect
_08051794:
	ldr r5, _08051880 @ =0x0203E010
	ldrh r3, [r5]
	cmp r3, #1
	bne _080517BA
	ldr r0, _08051884 @ =0x0200005C
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08051888 @ =0x0200F1C8
	adds r1, r1, r0
	ldr r0, [r1, #4]
	ldr r1, [r1, #8]
	ldr r2, _0805188C @ =0x020041C8
	adds r1, r1, r2
	str r1, [r4, #0x54]
	ldr r1, _08051890 @ =0x02000088
	bl LZ77UnCompWram
_080517BA:
	ldrh r5, [r5, #2]
	cmp r5, #1
	bne _080517DE
	ldr r0, _08051894 @ =0x02000060
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08051898 @ =0x02011BC8
	adds r1, r1, r0
	ldr r0, [r1, #4]
	ldr r1, [r1, #8]
	ldr r2, _0805189C @ =0x020099C8
	adds r1, r1, r2
	str r1, [r4, #0x58]
	ldr r1, _080518A0 @ =0x02002088
	bl LZ77UnCompWram
_080517DE:
	ldr r5, _080518A4 @ =0x0203E0B0
	ldr r0, [r5]
	cmp r0, #0
	beq _080517EC
	ldr r1, _080518A8 @ =0x02001088
	bl LZ77UnCompWram
_080517EC:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _080517F8
	ldr r1, _080518AC @ =0x02003088
	bl LZ77UnCompWram
_080517F8:
	ldr r1, _080518B0 @ =0x06014000
	ldr r0, _08051890 @ =0x02000088
	movs r2, #0x80
	lsls r2, r2, #7
	bl RegisterDataMove
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0xb
	strh r0, [r4, #0x2e]
	ldr r1, _080518B4 @ =0x0203E02E
	movs r5, #0
	ldrsh r0, [r1, r5]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x32]
	movs r2, #2
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x3a]
	movs r3, #4
	ldrsh r0, [r1, r3]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x34]
	movs r5, #6
	ldrsh r0, [r1, r5]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x3c]
	ldr r1, _080518B8 @ =0x081D8599
	ldr r2, _08051870 @ =0x0203E02C
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, r0, r1
	ldrb r5, [r0]
	strh r5, [r4, #0x36]
	ldr r1, _080518BC @ =0x081D859E
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, r0, r1
	ldrb r3, [r0]
	strh r3, [r4, #0x38]
	ldr r0, _080518C0 @ =0x02017744
	ldr r0, [r0]
	cmp r0, #0
	bne _080518C8
	ldr r0, _080518C4 @ =0x081D85A4
	movs r5, #0
	ldrsh r1, [r2, r5]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	adds r0, r1, r3
	strh r0, [r4, #0x38]
	b _080518D8
	.align 2, 0
_0805186C: .4byte 0x081D8594
_08051870: .4byte 0x0203E02C
_08051874: .4byte 0x081D856C
_08051878: .4byte 0x0203A3D8
_0805187C: .4byte 0x02022860
_08051880: .4byte 0x0203E010
_08051884: .4byte 0x0200005C
_08051888: .4byte 0x0200F1C8
_0805188C: .4byte 0x020041C8
_08051890: .4byte 0x02000088
_08051894: .4byte 0x02000060
_08051898: .4byte 0x02011BC8
_0805189C: .4byte 0x020099C8
_080518A0: .4byte 0x02002088
_080518A4: .4byte 0x0203E0B0
_080518A8: .4byte 0x02001088
_080518AC: .4byte 0x02003088
_080518B0: .4byte 0x06014000
_080518B4: .4byte 0x0203E02E
_080518B8: .4byte 0x081D8599
_080518BC: .4byte 0x081D859E
_080518C0: .4byte 0x02017744
_080518C4: .4byte 0x081D85A4
_080518C8:
	ldr r0, _080518E4 @ =0x081D85A4
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	subs r0, r5, r1
	strh r0, [r4, #0x36]
_080518D8:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080518E4: .4byte 0x081D85A4
