	.include "macro.inc"

	.syntax unified

	thumb_func_start AllocWeatherParticles
AllocWeatherParticles: @ 0x0802D424
	push {lr}
	subs r0, #1
	cmp r0, #5
	bhi _0802D464
	lsls r0, r0, #2
	ldr r1, _0802D438 @ =_0802D43C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802D438: .4byte _0802D43C
_0802D43C: @ jump table
	.4byte _0802D454 @ case 0
	.4byte _0802D454 @ case 1
	.4byte _0802D464 @ case 2
	.4byte _0802D454 @ case 3
	.4byte _0802D45C @ case 4
	.4byte _0802D454 @ case 5
_0802D454:
	movs r0, #0x20
	bl InitOam
	b _0802D46A
_0802D45C:
	movs r0, #0x10
	bl InitOam
	b _0802D46A
_0802D464:
	movs r0, #0
	bl InitOam
_0802D46A:
	pop {r0}
	bx r0
	.align 2, 0
