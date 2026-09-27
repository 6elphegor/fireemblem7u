	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBanimBossBGM
GetBanimBossBGM: @ 0x08068110
	push {r4, r5, lr}
	ldr r0, [r0]
	ldrb r2, [r0, #4]
	movs r3, #0
	ldr r0, _08068148 @ =0x08BDAF80
	ldr r1, [r0]
	movs r4, #1
	rsbs r4, r4, #0
	adds r5, r0, #0
	cmp r1, r4
	beq _0806813A
	cmp r2, r1
	beq _0806813A
	adds r1, r5, #0
_0806812C:
	adds r1, #8
	adds r3, #2
	ldr r0, [r1]
	cmp r0, r4
	beq _0806813A
	cmp r2, r0
	bne _0806812C
_0806813A:
	adds r0, r3, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08068148: .4byte 0x08BDAF80
