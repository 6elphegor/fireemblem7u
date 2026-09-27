	.include "macro.inc"

	.syntax unified

	thumb_func_start TacticianTryAppendChar
TacticianTryAppendChar: @ 0x0803F5DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r5, #0
	adds r6, #0x38
	movs r0, #0x3c
	adds r0, r0, r5
	mov r8, r0
	ldrb r1, [r6]
	ldrb r2, [r0]
	cmp r1, r2
	bhs _0803F65C
	movs r0, #2
	bl SioPlaySoundEffect
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	ldrb r1, [r6]
	adds r1, #0x3d
	adds r1, r5, r1
	bl SioStrCpy
	ldrb r2, [r6]
	lsls r0, r2, #1
	adds r2, r5, #0
	adds r2, #0x48
	adds r2, r2, r0
	ldr r1, _0803F644 @ =0x00003FFF
	ldrh r0, [r5, #0x34]
	ands r1, r0
	movs r0, #3
	ldrb r4, [r4]
	ands r0, r4
	lsls r0, r0, #0xe
	orrs r1, r0
	strh r1, [r2]
	ldrb r0, [r6]
	adds r0, #1
	mov r1, r8
	ldrb r1, [r1]
	cmp r0, r1
	bge _0803F648
	strb r0, [r6]
	b _0803F64C
	.align 2, 0
_0803F644: .4byte 0x00003FFF
_0803F648:
	movs r0, #5
	strh r0, [r5, #0x34]
_0803F64C:
	adds r0, r5, #0
	bl TacticianDrawCharacters
	adds r1, r5, #0
	adds r1, #0x39
	movs r0, #0
	strb r0, [r1]
	b _0803F662
_0803F65C:
	movs r0, #0
	bl SioPlaySoundEffect
_0803F662:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
