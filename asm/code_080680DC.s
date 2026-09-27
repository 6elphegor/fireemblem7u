	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrRestoreBGM
EkrRestoreBGM: @ 0x080680DC
	push {lr}
	bl CheckBanimHensei
	cmp r0, #1
	beq _080680FA
	ldr r1, _08068100 @ =0x0202BBB8
	movs r0, #0x20
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _080680FA
	ldr r0, _08068104 @ =0x020200A0
	ldr r0, [r0]
	cmp r0, #0
	bne _08068108
_080680FA:
	bl MakeBgmOverridePersist
	b _0806810C
	.align 2, 0
_08068100: .4byte 0x0202BBB8
_08068104: .4byte 0x020200A0
_08068108:
	bl sub_08003AF8
_0806810C:
	pop {r0}
	bx r0
