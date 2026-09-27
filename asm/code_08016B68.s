	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitItemHealAmount
GetUnitItemHealAmount: @ 0x08016B68
	push {r4, lr}
	adds r3, r0, #0
	adds r2, r1, #0
	movs r4, #0
	movs r0, #0xff
	ands r0, r2
	subs r0, #0x4a
	cmp r0, #0x50
	bls _08016B7C
	b _08016CDA
_08016B7C:
	lsls r0, r0, #2
	ldr r1, _08016B88 @ =_08016B8C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08016B88: .4byte _08016B8C
_08016B8C: @ jump table
	.4byte _08016CD0 @ case 0
	.4byte _08016CD4 @ case 1
	.4byte _08016CD8 @ case 2
	.4byte _08016CD0 @ case 3
	.4byte _08016CD0 @ case 4
	.4byte _08016CDA @ case 5
	.4byte _08016CDA @ case 6
	.4byte _08016CDA @ case 7
	.4byte _08016CDA @ case 8
	.4byte _08016CDA @ case 9
	.4byte _08016CDA @ case 10
	.4byte _08016CDA @ case 11
	.4byte _08016CDA @ case 12
	.4byte _08016CDA @ case 13
	.4byte _08016CDA @ case 14
	.4byte _08016CDA @ case 15
	.4byte _08016CDA @ case 16
	.4byte _08016CDA @ case 17
	.4byte _08016CDA @ case 18
	.4byte _08016CDA @ case 19
	.4byte _08016CDA @ case 20
	.4byte _08016CDA @ case 21
	.4byte _08016CDA @ case 22
	.4byte _08016CDA @ case 23
	.4byte _08016CDA @ case 24
	.4byte _08016CDA @ case 25
	.4byte _08016CDA @ case 26
	.4byte _08016CDA @ case 27
	.4byte _08016CDA @ case 28
	.4byte _08016CDA @ case 29
	.4byte _08016CDA @ case 30
	.4byte _08016CDA @ case 31
	.4byte _08016CDA @ case 32
	.4byte _08016CD0 @ case 33
	.4byte _08016CD8 @ case 34
	.4byte _08016CDA @ case 35
	.4byte _08016CDA @ case 36
	.4byte _08016CDA @ case 37
	.4byte _08016CDA @ case 38
	.4byte _08016CDA @ case 39
	.4byte _08016CDA @ case 40
	.4byte _08016CDA @ case 41
	.4byte _08016CDA @ case 42
	.4byte _08016CDA @ case 43
	.4byte _08016CDA @ case 44
	.4byte _08016CDA @ case 45
	.4byte _08016CDA @ case 46
	.4byte _08016CDA @ case 47
	.4byte _08016CDA @ case 48
	.4byte _08016CDA @ case 49
	.4byte _08016CDA @ case 50
	.4byte _08016CDA @ case 51
	.4byte _08016CDA @ case 52
	.4byte _08016CDA @ case 53
	.4byte _08016CDA @ case 54
	.4byte _08016CDA @ case 55
	.4byte _08016CDA @ case 56
	.4byte _08016CDA @ case 57
	.4byte _08016CDA @ case 58
	.4byte _08016CDA @ case 59
	.4byte _08016CDA @ case 60
	.4byte _08016CDA @ case 61
	.4byte _08016CDA @ case 62
	.4byte _08016CDA @ case 63
	.4byte _08016CDA @ case 64
	.4byte _08016CDA @ case 65
	.4byte _08016CDA @ case 66
	.4byte _08016CDA @ case 67
	.4byte _08016CDA @ case 68
	.4byte _08016CDA @ case 69
	.4byte _08016CDA @ case 70
	.4byte _08016CDA @ case 71
	.4byte _08016CDA @ case 72
	.4byte _08016CDA @ case 73
	.4byte _08016CDA @ case 74
	.4byte _08016CDA @ case 75
	.4byte _08016CDA @ case 76
	.4byte _08016CDA @ case 77
	.4byte _08016CDA @ case 78
	.4byte _08016CDA @ case 79
	.4byte _08016CD0 @ case 80
_08016CD0:
	movs r4, #0xa
	b _08016CDA
_08016CD4:
	movs r4, #0x14
	b _08016CDA
_08016CD8:
	movs r4, #0x50
_08016CDA:
	movs r1, #0xff
	ands r1, r2
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08016D08 @ =0x08BE222C
	adds r0, r0, r1
	ldr r0, [r0, #8]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08016D00
	adds r0, r3, #0
	bl GetUnitPower
	adds r4, r4, r0
	cmp r4, #0x50
	ble _08016D00
	movs r4, #0x50
_08016D00:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08016D08: .4byte 0x08BE222C
