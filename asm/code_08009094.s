	.include "macro.inc"

	.syntax unified

	thumb_func_start TalkFaceMove_OnInit
TalkFaceMove_OnInit: @ 0x08009094
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0
	str r0, [r6, #0x58]
	adds r4, r6, #0
	adds r4, #0x66
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl GetTalkFaceHPos
	adds r5, r6, #0
	adds r5, #0x68
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r0, #3
	subs r1, r1, r0
	cmp r1, #0
	bge _080090CE
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl GetTalkFaceHPos
	lsls r0, r0, #3
	movs r2, #0
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	cmp r0, #0x18
	bgt _080090E2
	b _080090E6
_080090CE:
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl GetTalkFaceHPos
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r0, #3
	subs r1, r1, r0
	cmp r1, #0x18
	ble _080090E6
_080090E2:
	movs r0, #0x20
	b _080090E8
_080090E6:
	movs r0, #0x10
_080090E8:
	str r0, [r6, #0x5c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
