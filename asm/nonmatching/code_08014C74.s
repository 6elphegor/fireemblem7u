	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014C74
sub_08014C74: @ 0x08014C74
	cmp r0, #1
	beq _08014C9C
	cmp r0, #1
	bgt _08014C82
	cmp r0, #0
	beq _08014C8C
	b _08014CCC
_08014C82:
	cmp r0, #2
	beq _08014CAC
	cmp r0, #3
	beq _08014CBC
	b _08014CCC
_08014C8C:
	lsls r0, r2, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08014C98 @ =0x02022C60
	adds r0, r0, r1
	b _08014CCE
	.align 2, 0
_08014C98: .4byte 0x02022C60
_08014C9C:
	lsls r0, r2, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08014CA8 @ =0x02023460
	adds r0, r0, r1
	b _08014CCE
	.align 2, 0
_08014CA8: .4byte 0x02023460
_08014CAC:
	lsls r0, r2, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08014CB8 @ =0x02023C60
	adds r0, r0, r1
	b _08014CCE
	.align 2, 0
_08014CB8: .4byte 0x02023C60
_08014CBC:
	lsls r0, r2, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08014CC8 @ =0x02024460
	adds r0, r0, r1
	b _08014CCE
	.align 2, 0
_08014CC8: .4byte 0x02024460
_08014CCC:
	movs r0, #0
_08014CCE:
	bx lr
