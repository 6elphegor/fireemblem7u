	.include "macro.inc"

	.syntax unified

	thumb_func_start TryAddToDropTargetList
TryAddToDropTargetList: @ 0x08023E6C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, _08023EB8 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r5, r6, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08023EB0
	ldr r0, _08023EBC @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	ldr r1, _08023EC0 @ =0x0202E3E0
	ldr r1, [r1]
	adds r1, r5, r1
	ldr r1, [r1]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023EB0
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl EnlistTarget
_08023EB0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08023EB8: .4byte 0x0202E3DC
_08023EBC: .4byte 0x02033E40
_08023EC0: .4byte 0x0202E3E0
