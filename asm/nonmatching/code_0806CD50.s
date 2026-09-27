	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplyMoveScriptToCoordinates
ApplyMoveScriptToCoordinates: @ 0x0806CD50
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
_0806CD5C:
	b _0806CD60
_0806CD5E:
	.byte 0x4A, 0xE0
_0806CD60:
	adds r0, r7, #0
	adds r0, #8
	ldr r2, [r0]
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, #1
	str r2, [r0]
	cmp r1, #0xa
	bhi _0806CDF2
	adds r0, r1, #0
	lsls r1, r0, #2
	ldr r2, _0806CD80 @ =_0806CD84
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0806CD80: .4byte _0806CD84
_0806CD84: @ jump table
	.4byte _0806CDB0 @ case 0
	.4byte _0806CDB2 @ case 1
	.4byte _0806CDC0 @ case 2
	.4byte _0806CDDC @ case 3
	.4byte _0806CDCE @ case 4
	.4byte _0806CDB0 @ case 5
	.4byte _0806CDF2 @ case 6
	.4byte _0806CDF2 @ case 7
	.4byte _0806CDF2 @ case 8
	.4byte _0806CDF2 @ case 9
	.4byte _0806CDEA @ case 10
_0806CDB0:
	b _0806CDF6
_0806CDB2:
	ldr r1, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1]
	subs r1, r2, #1
	str r1, [r0]
	b _0806CDF4
_0806CDC0:
	ldr r1, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	b _0806CDF4
_0806CDCE:
	ldr r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r1]
	subs r1, r2, #1
	str r1, [r0]
	b _0806CDF4
_0806CDDC:
	ldr r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	b _0806CDF4
_0806CDEA:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806CDF4
_0806CDF2:
	b _0806CDF4
_0806CDF4:
	b _0806CD5C
_0806CDF6:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
