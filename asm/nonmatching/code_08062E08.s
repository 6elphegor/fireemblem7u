	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxSunakemuriOBJ
NewEfxSunakemuriOBJ: @ 0x08062E08
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _08062E70 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062E74 @ =0x08BA441C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r2, _08062E78 @ =0x08BB1320
	cmp r4, #0
	beq _08062E36
	ldr r2, _08062E7C @ =0x08BB15B0
	cmp r4, #1
	bne _08062E36
	ldr r2, _08062E80 @ =0x08BB1468
_08062E36:
	ldr r3, _08062E84 @ =0x08BB13C4
	cmp r4, #0
	beq _08062E44
	ldr r3, _08062E88 @ =0x08BB1654
	cmp r4, #1
	bne _08062E44
	ldr r3, _08062E8C @ =0x08BB150C
_08062E44:
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x60]
	ldr r4, _08062E90 @ =0x0203E0D8
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x40
	bls _08062E66
	b _08062FD0
_08062E66:
	lsls r0, r0, #2
	ldr r1, _08062E94 @ =_08062E98
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08062E70: .4byte 0x0201774C
_08062E74: .4byte 0x08BA441C
_08062E78: .4byte 0x08BB1320
_08062E7C: .4byte 0x08BB15B0
_08062E80: .4byte 0x08BB1468
_08062E84: .4byte 0x08BB13C4
_08062E88: .4byte 0x08BB1654
_08062E8C: .4byte 0x08BB150C
_08062E90: .4byte 0x0203E0D8
_08062E94: .4byte _08062E98
_08062E98: @ jump table
	.4byte _08062FD0 @ case 0
	.4byte _08062F9C @ case 1
	.4byte _08062F9C @ case 2
	.4byte _08062F9C @ case 3
	.4byte _08062F9C @ case 4
	.4byte _08062F9C @ case 5
	.4byte _08062FC8 @ case 6
	.4byte _08062FC8 @ case 7
	.4byte _08062FC8 @ case 8
	.4byte _08062FC8 @ case 9
	.4byte _08062F9C @ case 10
	.4byte _08062FC8 @ case 11
	.4byte _08062F9C @ case 12
	.4byte _08062F9C @ case 13
	.4byte _08062F9C @ case 14
	.4byte _08062F9C @ case 15
	.4byte _08062FB8 @ case 16
	.4byte _08062F9C @ case 17
	.4byte _08062F9C @ case 18
	.4byte _08062F9C @ case 19
	.4byte _08062FA4 @ case 20
	.4byte _08062FB8 @ case 21
	.4byte _08062FB8 @ case 22
	.4byte _08062FC8 @ case 23
	.4byte _08062FC8 @ case 24
	.4byte _08062F9C @ case 25
	.4byte _08062F9C @ case 26
	.4byte _08062F9C @ case 27
	.4byte _08062F9C @ case 28
	.4byte _08062FC8 @ case 29
	.4byte _08062FC8 @ case 30
	.4byte _08062FC8 @ case 31
	.4byte _08062FC8 @ case 32
	.4byte _08062FC8 @ case 33
	.4byte _08062F9C @ case 34
	.4byte _08062F9C @ case 35
	.4byte _08062FC8 @ case 36
	.4byte _08062F9C @ case 37
	.4byte _08062F9C @ case 38
	.4byte _08062F9C @ case 39
	.4byte _08062F9C @ case 40
	.4byte _08062F9C @ case 41
	.4byte _08062F9C @ case 42
	.4byte _08062F9C @ case 43
	.4byte _08062FD0 @ case 44
	.4byte _08062FC8 @ case 45
	.4byte _08062FD0 @ case 46
	.4byte _08062F9C @ case 47
	.4byte _08062FC8 @ case 48
	.4byte _08062FC8 @ case 49
	.4byte _08062FC8 @ case 50
	.4byte _08062F9C @ case 51
	.4byte _08062FD0 @ case 52
	.4byte _08062FD0 @ case 53
	.4byte _08062FB8 @ case 54
	.4byte _08062FC8 @ case 55
	.4byte _08062F9C @ case 56
	.4byte _08062F9C @ case 57
	.4byte _08062F9C @ case 58
	.4byte _08062F9C @ case 59
	.4byte _08062FB8 @ case 60
	.4byte _08062F9C @ case 61
	.4byte _08062FC8 @ case 62
	.4byte _08062F9C @ case 63
	.4byte _08062F9C @ case 64
_08062F9C:
	ldr r0, _08062FA0 @ =0x081FB454
	b _08062FBA
	.align 2, 0
_08062FA0: .4byte 0x081FB454
_08062FA4:
	ldr r0, [r5, #0x5c]
	bl IsAnimSoundInPositionMaybe
	cmp r0, #0
	beq _08062FB8
	ldr r0, _08062FB4 @ =0x081FB454
	b _08062FBA
	.align 2, 0
_08062FB4: .4byte 0x081FB454
_08062FB8:
	ldr r0, _08062FC4 @ =0x081FB474
_08062FBA:
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	b _08062FD0
	.align 2, 0
_08062FC4: .4byte 0x081FB474
_08062FC8:
	ldr r0, _08062FE4 @ =0x081FB494
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
_08062FD0:
	ldr r0, _08062FE8 @ =0x081FAFE4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062FE4: .4byte 0x081FB494
_08062FE8: .4byte 0x081FAFE4
