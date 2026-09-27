	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08052A30
sub_08052A30: @ 0x08052A30
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0xe
	bhi _08052AF8
	lsls r0, r0, #2
	ldr r1, _08052A48 @ =_08052A4C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08052A48: .4byte _08052A4C
_08052A4C: @ jump table
	.4byte _08052AF8 @ case 0
	.4byte _08052A88 @ case 1
	.4byte _08052A90 @ case 2
	.4byte _08052A98 @ case 3
	.4byte _08052AA0 @ case 4
	.4byte _08052AA8 @ case 5
	.4byte _08052AB0 @ case 6
	.4byte _08052AB8 @ case 7
	.4byte _08052AC0 @ case 8
	.4byte _08052AC8 @ case 9
	.4byte _08052AD0 @ case 10
	.4byte _08052AD8 @ case 11
	.4byte _08052AE0 @ case 12
	.4byte _08052AE8 @ case 13
	.4byte _08052AF0 @ case 14
_08052A88:
	ldr r0, _08052A8C @ =0x08BE4C56
	b _08052AFA
	.align 2, 0
_08052A8C: .4byte 0x08BE4C56
_08052A90:
	ldr r0, _08052A94 @ =0x08BE4C97
	b _08052AFA
	.align 2, 0
_08052A94: .4byte 0x08BE4C97
_08052A98:
	ldr r0, _08052A9C @ =0x08BE4CD8
	b _08052AFA
	.align 2, 0
_08052A9C: .4byte 0x08BE4CD8
_08052AA0:
	ldr r0, _08052AA4 @ =0x08BE4D19
	b _08052AFA
	.align 2, 0
_08052AA4: .4byte 0x08BE4D19
_08052AA8:
	ldr r0, _08052AAC @ =0x08BE4D5A
	b _08052AFA
	.align 2, 0
_08052AAC: .4byte 0x08BE4D5A
_08052AB0:
	ldr r0, _08052AB4 @ =0x08BE4D9B
	b _08052AFA
	.align 2, 0
_08052AB4: .4byte 0x08BE4D9B
_08052AB8:
	ldr r0, _08052ABC @ =0x08BE4DDC
	b _08052AFA
	.align 2, 0
_08052ABC: .4byte 0x08BE4DDC
_08052AC0:
	ldr r0, _08052AC4 @ =0x08BE4E1D
	b _08052AFA
	.align 2, 0
_08052AC4: .4byte 0x08BE4E1D
_08052AC8:
	ldr r0, _08052ACC @ =0x08BE4E5E
	b _08052AFA
	.align 2, 0
_08052ACC: .4byte 0x08BE4E5E
_08052AD0:
	ldr r0, _08052AD4 @ =0x08BE4E9F
	b _08052AFA
	.align 2, 0
_08052AD4: .4byte 0x08BE4E9F
_08052AD8:
	ldr r0, _08052ADC @ =0x08BE4EE0
	b _08052AFA
	.align 2, 0
_08052ADC: .4byte 0x08BE4EE0
_08052AE0:
	ldr r0, _08052AE4 @ =0x08BE4F21
	b _08052AFA
	.align 2, 0
_08052AE4: .4byte 0x08BE4F21
_08052AE8:
	ldr r0, _08052AEC @ =0x08BE4F62
	b _08052AFA
	.align 2, 0
_08052AEC: .4byte 0x08BE4F62
_08052AF0:
	ldr r0, _08052AF4 @ =0x08BE4FA3
	b _08052AFA
	.align 2, 0
_08052AF4: .4byte 0x08BE4FA3
_08052AF8:
	ldr r0, _08052B04 @ =0x08BE4C15
_08052AFA:
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_08052B04: .4byte 0x08BE4C15
