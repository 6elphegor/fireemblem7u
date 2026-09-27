	.include "macro.inc"

	.syntax unified

	thumb_func_start ShouldSkipGasTrapDisplay
ShouldSkipGasTrapDisplay: @ 0x0802BF84
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	adds r6, r1, #0
	movs r7, #0
	movs r4, #0
	movs r5, #1
	cmp r2, #1
	beq _0802BFBA
	cmp r2, #1
	bgt _0802BF9E
	cmp r2, #0
	beq _0802BFB4
	b _0802BFBC
_0802BF9E:
	cmp r2, #2
	beq _0802BFAE
	cmp r2, #3
	bne _0802BFBC
	movs r7, #0
	movs r4, #1
	rsbs r4, r4, #0
	b _0802BFBC
_0802BFAE:
	movs r7, #0
	movs r4, #1
	b _0802BFBC
_0802BFB4:
	movs r7, #1
	rsbs r7, r7, #0
	b _0802BFBC
_0802BFBA:
	movs r7, #1
_0802BFBC:
	ldr r0, _0802BFE8 @ =0x0202E3DC
	ldr r1, [r0]
	movs r2, #2
	lsls r0, r6, #2
	adds r1, r0, r1
	lsls r4, r4, #2
_0802BFC8:
	adds r3, r3, r7
	adds r1, r1, r4
	ldr r0, [r1]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802BFD8
	movs r5, #0
_0802BFD8:
	subs r2, #1
	cmp r2, #0
	bge _0802BFC8
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802BFE8: .4byte 0x0202E3DC
