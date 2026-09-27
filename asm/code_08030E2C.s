	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08030E2C
sub_08030E2C: @ 0x08030E2C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _08030E68 @ =0x03004690
	ldr r5, [r0]
	ldr r6, _08030E6C @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	ldr r1, _08030E70 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r6, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	bne _08030E74
	movs r0, #0x14
	ldrsh r2, [r6, r0]
	movs r1, #0x16
	ldrsh r3, [r6, r1]
	adds r0, r7, #0
	adds r1, r5, #0
	bl StartPrepUnitSwap
	b _08030E94
	.align 2, 0
_08030E68: .4byte 0x03004690
_08030E6C: .4byte 0x0202BBB8
_08030E70: .4byte 0x0202E3DC
_08030E74:
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
	adds r0, r7, #0
	adds r1, r5, #0
	bl StartPrepUnitSwap
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	adds r0, r7, #0
	adds r1, r4, #0
	bl StartPrepUnitSwap
_08030E94:
	ldr r0, _08030EAC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08030EA6
	ldr r0, _08030EB0 @ =0x00000381
	bl m4aSongNumStart
_08030EA6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030EAC: .4byte 0x0202BBF8
_08030EB0: .4byte 0x00000381
