	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitSpriteHoverUpdate
UnitSpriteHoverUpdate: @ 0x08025FA8
	push {r4, lr}
	ldr r2, _0802600C @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _08026010 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08026018
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08026018
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _08026018
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _08026018
	cmp r1, #2
	beq _08026018
	ldr r1, _08026014 @ =0x0203A3D4
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #5
	bne _08026018
	adds r0, r4, #0
	bl StartMu
	adds r0, r4, #0
	bl HideUnitSprite
	b _08026052
	.align 2, 0
_0802600C: .4byte 0x0202BBB8
_08026010: .4byte 0x0202E3DC
_08026014: .4byte 0x0203A3D4
_08026018:
	ldr r2, _08026058 @ =0x0202BBB8
	ldr r1, [r2, #0x18]
	ldr r0, [r2, #0x14]
	cmp r1, r0
	beq _08026052
	ldr r1, _0802605C @ =0x0203A3D4
	movs r0, #0
	str r0, [r1]
	movs r3, #0x1a
	ldrsh r0, [r2, r3]
	ldr r1, _08026060 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x18
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08026052
	bl EndAllMus
	adds r0, r4, #0
	bl ShowUnitSprite
_08026052:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08026058: .4byte 0x0202BBB8
_0802605C: .4byte 0x0203A3D4
_08026060: .4byte 0x0202E3DC
