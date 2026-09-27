	.include "macro.inc"

	.syntax unified

	thumb_func_start PutChapterIntroMotif
PutChapterIntroMotif: @ 0x0801F348
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r6, #0
	ldr r4, _0801F3A4 @ =0x02023C60
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _0801F3A8 @ =0x083FF538
	ldr r5, _0801F3AC @ =0x02001F72
	adds r1, r5, #0
	bl Decompress
	movs r1, #0
	mov ip, r4
	mov r8, r5
	ldr r0, _0801F3B0 @ =0x00005001
	adds r5, r0, #0
_0801F36E:
	movs r3, #0
	adds r4, r1, #1
	lsls r1, r4, #5
	adds r1, #3
	lsls r0, r6, #1
	mov r7, r8
	adds r2, r0, r7
	lsls r1, r1, #1
	add r1, ip
_0801F380:
	ldrh r7, [r2]
	adds r0, r5, r7
	strh r0, [r1]
	adds r2, #2
	adds r6, #1
	adds r1, #2
	adds r3, #1
	cmp r3, #0x17
	ble _0801F380
	adds r1, r4, #0
	cmp r1, #0x11
	ble _0801F36E
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F3A4: .4byte 0x02023C60
_0801F3A8: .4byte 0x083FF538
_0801F3AC: .4byte 0x02001F72
_0801F3B0: .4byte 0x00005001
