	.include "macro.inc"

	.syntax unified

	thumb_func_start GetEfxSoundType1FromTerrain
GetEfxSoundType1FromTerrain: @ 0x08067B20
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne _08067B32
_08067B2E:
	movs r0, #0
	b _08067C66
_08067B32:
	cmp r4, #0x40
	bls _08067B38
	b _08067C64
_08067B38:
	lsls r0, r4, #2
	ldr r1, _08067B44 @ =_08067B48
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08067B44: .4byte _08067B48
_08067B48: @ jump table
	.4byte _08067C64 @ case 0
	.4byte _08067B2E @ case 1
	.4byte _08067B2E @ case 2
	.4byte _08067B2E @ case 3
	.4byte _08067B2E @ case 4
	.4byte _08067B2E @ case 5
	.4byte _08067C60 @ case 6
	.4byte _08067C60 @ case 7
	.4byte _08067C60 @ case 8
	.4byte _08067C60 @ case 9
	.4byte _08067B2E @ case 10
	.4byte _08067C60 @ case 11
	.4byte _08067C4C @ case 12
	.4byte _08067C4C @ case 13
	.4byte _08067C58 @ case 14
	.4byte _08067C58 @ case 15
	.4byte _08067C50 @ case 16
	.4byte _08067B2E @ case 17
	.4byte _08067C54 @ case 18
	.4byte _08067C5C @ case 19
	.4byte _08067C5C @ case 20
	.4byte _08067C50 @ case 21
	.4byte _08067C50 @ case 22
	.4byte _08067C60 @ case 23
	.4byte _08067C60 @ case 24
	.4byte _08067B2E @ case 25
	.4byte _08067B2E @ case 26
	.4byte _08067B2E @ case 27
	.4byte _08067B2E @ case 28
	.4byte _08067C60 @ case 29
	.4byte _08067C60 @ case 30
	.4byte _08067C60 @ case 31
	.4byte _08067C60 @ case 32
	.4byte _08067C60 @ case 33
	.4byte _08067B2E @ case 34
	.4byte _08067B2E @ case 35
	.4byte _08067C60 @ case 36
	.4byte _08067B2E @ case 37
	.4byte _08067C54 @ case 38
	.4byte _08067B2E @ case 39
	.4byte _08067B2E @ case 40
	.4byte _08067B2E @ case 41
	.4byte _08067C54 @ case 42
	.4byte _08067B2E @ case 43
	.4byte _08067C64 @ case 44
	.4byte _08067C60 @ case 45
	.4byte _08067C64 @ case 46
	.4byte _08067B2E @ case 47
	.4byte _08067C60 @ case 48
	.4byte _08067C60 @ case 49
	.4byte _08067C60 @ case 50
	.4byte _08067B2E @ case 51
	.4byte _08067C64 @ case 52
	.4byte _08067C64 @ case 53
	.4byte _08067C50 @ case 54
	.4byte _08067C60 @ case 55
	.4byte _08067B2E @ case 56
	.4byte _08067B2E @ case 57
	.4byte _08067C54 @ case 58
	.4byte _08067C54 @ case 59
	.4byte _08067C50 @ case 60
	.4byte _08067C54 @ case 61
	.4byte _08067C60 @ case 62
	.4byte _08067B2E @ case 63
	.4byte _08067B2E @ case 64
_08067C4C:
	movs r0, #1
	b _08067C66
_08067C50:
	movs r0, #2
	b _08067C66
_08067C54:
	movs r0, #3
	b _08067C66
_08067C58:
	movs r0, #4
	b _08067C66
_08067C5C:
	movs r0, #5
	b _08067C66
_08067C60:
	movs r0, #6
	b _08067C66
_08067C64:
	movs r0, #0
_08067C66:
	pop {r4}
	pop {r1}
	bx r1
