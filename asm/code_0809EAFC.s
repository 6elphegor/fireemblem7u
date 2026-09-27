	.include "macro.inc"

	.syntax unified

	thumb_func_start GetRankDataValidBitMap
GetRankDataValidBitMap: @ 0x0809EAFC
	push {r4, lr}
	sub sp, #0x94
	movs r4, #0
	bl IsGamePlayedThrough
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809EB10
	movs r0, #0
	b _0809EB70
_0809EB10:
	mov r0, sp
	bl LoadAndVerfyRankData
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809EB6E
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809EB28
	movs r4, #1
_0809EB28:
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809EB36
	movs r0, #2
	orrs r4, r0
_0809EB36:
	add r0, sp, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809EB44
	movs r0, #4
	orrs r4, r0
_0809EB44:
	add r0, sp, #0x48
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809EB52
	movs r0, #8
	orrs r4, r0
_0809EB52:
	add r0, sp, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809EB60
	movs r0, #0x10
	orrs r4, r0
_0809EB60:
	add r0, sp, #0x78
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809EB6E
	movs r0, #0x20
	orrs r4, r0
_0809EB6E:
	adds r0, r4, #0
_0809EB70:
	add sp, #0x94
	pop {r4}
	pop {r1}
	bx r1
