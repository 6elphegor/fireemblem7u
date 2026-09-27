	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplyMapChange
ApplyMapChange: @ 0x0802BD68
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r6, #0
	bl GetMapChange
	adds r3, r0, #0
	ldr r4, [r3, #8]
	ldrb r0, [r3, #4]
	cmp r6, r0
	bge _0802BDC2
	ldr r7, _0802BDD0 @ =0x08B932B4
	mov r8, r7
_0802BD84:
	movs r5, #0
	adds r0, r6, #1
	mov sb, r0
	ldrb r7, [r3, #3]
	cmp r5, r7
	bge _0802BDBA
	mov ip, r8
_0802BD92:
	ldrh r2, [r4]
	cmp r2, #0
	beq _0802BDB0
	ldrb r0, [r3, #2]
	adds r1, r0, r6
	mov r7, ip
	ldr r0, [r7]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r7, [r3, #1]
	adds r0, r7, r5
	ldr r1, [r1]
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r2, [r0]
_0802BDB0:
	adds r4, #2
	adds r5, #1
	ldrb r0, [r3, #3]
	cmp r5, r0
	blt _0802BD92
_0802BDBA:
	mov r6, sb
	ldrb r7, [r3, #4]
	cmp r6, r7
	blt _0802BD84
_0802BDC2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802BDD0: .4byte 0x08B932B4
