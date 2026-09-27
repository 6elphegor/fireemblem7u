	.include "macro.inc"

	.syntax unified

	thumb_func_start Event_EndSkip
Event_EndSkip: @ 0x0800E614
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	ldr r0, _0800E65C @ =0x0000FFFB
	ldrh r2, [r1]
	ands r0, r2
	movs r4, #0
	strh r0, [r1]
	bl ApplySystemGraphics
	bl UnpackChapterMapPalette
	bl ApplyUnitSpritePalettes
	ldr r2, _0800E660 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	adds r1, r5, #0
	adds r1, #0x4d
	movs r0, #1
	strb r0, [r1]
	str r4, [r5, #0x40]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800E65C: .4byte 0x0000FFFB
_0800E660: .4byte 0x03002870
